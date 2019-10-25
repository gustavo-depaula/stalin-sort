//Programa que ordena las filas de una matriz segundo la media de estas (menor a moyor)
#include <iostream>
using namespace std;
int main()
{
	const int MAX_F=10, MAX_C=10;
	int m[MAX_F][MAX_C]={0},grado,cont=1;
	
	
	  //Introduccion
   do{
   	
		cout<<" Indica el grado de la matriz caracol (mayor o igual que 3) : ";
   	cin>>grado;
   
		} while ( grado < 3 || grado%2==0 );

		//Procesos
		
		for (int i=0; i<grado; i++){ //fila (lo que se mueve)
			
			for(int j=0; j<grado-i; j++)  //columna
				if (m[i][j]==0)         
				m[i][j]=cont++;
			
			for (int j=0; j<grado-i; j++)  //fila
				if (m[j][grado-(i+1)]==0)		
				m[j][grado-(i+1)]=cont++;
				
			for(int j=grado-1; j>=0; j--)  //columna
				if (m[grado-(i+1)][j]==0)			
				m[grado-(i+1)][j]=cont++;
			
			for (int j=grado-1; j>=0; j--)  //fila
				if (m[j][i]==0)
				m[j][i]=cont++;
			
		}
		
		for (int i=0; i<grado; i++){		
			for(int j=0; j<grado; j++)	{
				if(m[i][j]<10)
				cout<<"0";
				cout<<m[i][j]<<" ";
		}
			cout<<endl;}

	system("pause");
}
			
			
