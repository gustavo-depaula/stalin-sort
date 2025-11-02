namespace Tests

open System
open NUnit.Framework
open Program

[<TestClass>]
type TestClass () =

    [<SetUp>]
    member this.Setup () =
        ()

    [<Test>]
    member this.Test1 () =
        let nonsorted_list = [1; 2; 4; 3; 6; 8; 0; 9; 5; 7]
        let sorted_list_ref = [1; 2; 4; 6; 8; 9]
        let sorted_list_exp = Program.StalinSort nonsorted_list
        Assert.True((List.length sorted_list_ref) = (List.length sorted_list_exp))

    [<Test>]
    member this.Test2 () =
        let nonsorted_list = [1; 2; 1; 1; 4; 3; 9]
        let sorted_list_ref = [1; 2; 4; 9]
        let sorted_list_exp = Program.StalinSort nonsorted_list
        Assert.True((List.length sorted_list_ref) = (List.length sorted_list_exp))
