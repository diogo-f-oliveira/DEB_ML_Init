function [data, auxData, metaData, txtData, weights] = mydata_Helicolenus_dactylopterus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Helicolenus_dactylopterus'; 
metaData.species_en = 'Blackbelly rosefish'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 

%% set data
% zero-variate data

data.am = 43*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AllaLora2000';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.28; units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'MunkNiel2005'; 
data.Lp  = 32;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 1550;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Wiki';

data.Ri  = 428343/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(22);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% tL-data
data.tL = [ ...
0.871	10.563
0.916	9.192
0.919	11.208
1.774	11.448
1.823	12.416
1.824	13.061
1.868	10.883
1.910	7.415
1.911	8.383
1.912	8.867
1.913	9.190
1.913	9.593
1.914	10.157
2.864	10.881
2.865	11.284
2.867	12.736
2.868	13.059
2.869	13.543
2.871	15.075
2.910	9.752
2.911	10.236
2.913	11.849
2.957	9.349
3.777	17.654
3.825	18.299
3.826	18.702
3.867	14.589
3.867	14.911
3.909	11.121
3.910	12.169
3.911	12.653
3.912	13.137
3.912	13.379
3.913	13.944
3.916	15.557
3.916	16.121
3.917	16.686
3.918	17.089
3.921	19.186
4.822	18.619
4.823	19.103
4.824	19.668
4.856	9.990
4.858	11.119
4.858	11.442
4.864	14.909
4.864	15.151
4.865	15.635
4.867	16.845
4.867	17.248
4.868	17.571
4.869	18.135
4.906	12.006
4.907	12.571
4.908	13.055
4.909	13.619
4.910	14.022
4.910	14.425
4.913	15.958
4.913	16.361
4.967	20.232
5.627	17.650
5.813	15.311
5.856	12.246
5.858	13.698
5.859	14.262
5.860	14.666
5.860	14.988
5.862	15.875
5.862	16.359
5.863	16.682
5.864	17.166
5.865	18.053
5.866	18.456
5.867	19.101
5.867	19.504
5.868	19.988
5.916	20.472
5.952	13.214
5.964	20.875
5.965	21.117
6.809	14.664
6.809	15.147
6.820	21.599
6.821	22.647
6.854	13.212
6.855	13.696
6.855	14.260
6.857	15.551
6.858	16.115
6.859	16.599
6.860	17.002
6.861	17.486
6.861	17.889
6.862	18.373
6.863	18.857
6.863	19.180
6.864	19.502
6.864	19.986
6.865	20.470
6.866	20.793
6.866	21.196
6.917	22.970
6.919	24.180
6.947	12.163
7.811	18.129
7.811	18.533
7.813	19.500
7.813	19.984
7.852	14.258
7.856	16.920
7.857	17.403
7.857	17.645
7.860	19.178
7.862	20.549
7.862	20.871
7.863	21.355
7.863	21.516
7.864	22.081
7.902	16.194
7.903	16.597
7.913	23.048
7.915	24.016
7.948	15.145
8.812	21.595
8.856	19.014
8.857	19.498
8.857	19.901
8.858	20.143
8.858	20.143
8.858	20.305
8.858	20.466
8.858	20.547
8.859	21.192
8.862	22.643
8.862	23.127
8.864	24.014
8.901	17.885
8.903	18.530
8.913	25.305
8.917	27.885
8.946	16.030
8.948	17.079
8.948	17.563
9.770	27.077
9.817	26.593
9.852	18.770
9.853	19.416
9.854	19.819
9.854	20.383
9.855	20.625
9.855	20.948
9.856	21.270
9.856	21.512
9.858	22.399
9.858	22.803
9.859	23.206
9.860	23.770
9.860	24.174
9.861	24.657
9.862	25.141
9.863	25.545
9.863	26.109
9.898	18.206
9.992	17.077
10.848	18.607
10.849	19.091
10.849	19.414
10.850	19.817
10.851	20.220
10.852	20.784
10.852	21.107
10.853	21.914
10.854	22.155
10.854	22.397
10.854	22.639
10.855	23.123
10.856	23.849
10.857	24.252
10.858	24.575
10.858	24.978
10.859	25.462
10.860	25.946
10.860	26.268
10.861	26.591
10.861	26.994
10.895	18.042
10.900	21.591
10.939	16.107
11.757	23.041
11.757	23.283
11.795	17.234
11.802	21.428
11.802	21.750
11.803	22.154
11.803	22.476
11.847	20.379
11.853	23.928
11.892	18.363
11.892	18.605
11.893	19.169
11.893	19.411
11.894	19.895
11.901	24.411
11.902	24.653
11.902	25.137
11.903	25.540
11.904	26.266
11.905	26.589
11.943	21.024
11.951	25.782
12.751	21.668
12.752	22.152
12.752	22.555
12.753	22.797
12.753	23.119
12.794	19.006
12.802	23.845
12.802	24.087
12.807	27.232
12.848	23.361
12.855	27.635
12.856	28.200
12.891	20.216
12.891	20.458
12.892	20.780
12.893	21.264
12.899	25.135
12.899	25.458
12.900	25.780
12.900	26.184
13.791	19.569
13.798	23.520
13.838	19.166
13.839	19.891
13.840	20.295
13.841	20.617
13.841	21.101
13.842	21.424
13.842	21.746
13.843	21.988
13.844	22.633
13.846	23.924
13.846	24.246
13.847	24.569
13.847	24.972
13.848	25.456
13.849	25.940
13.850	26.585
13.851	26.907
13.851	27.230
14.802	28.599
14.808	32.067
14.835	19.164
14.837	20.696
14.838	21.341
14.840	22.309
14.840	22.551
14.841	23.035
14.842	23.518
14.842	23.841
14.843	24.244
14.843	24.325
14.843	24.647
14.895	27.228
14.986	24.970
14.988	25.776
15.793	25.129
15.794	25.533
15.794	25.855
15.795	26.258
15.797	27.307
15.831	19.000
15.834	21.097
15.836	22.226
15.837	22.549
15.837	22.871
15.838	23.194
15.838	23.597
15.839	24.242
15.840	24.565
15.840	24.726
15.894	28.597
15.942	29.565
16.790	25.531
16.791	25.853
16.791	26.256
16.792	26.579
16.833	22.627
16.834	23.030
16.836	24.321
16.837	24.966
16.842	28.514
16.876	19.966
16.880	22.063
17.828	21.577
17.836	26.577
17.838	28.190
17.875	21.093
17.881	25.125
17.881	25.367
17.882	25.609
17.889	30.044
17.921	20.770
17.926	23.351
18.779	23.107
18.781	23.914
18.827	23.510
18.830	25.285
18.832	26.575
18.834	27.543
18.834	27.865
18.835	28.188
18.836	29.075
18.966	21.091
19.779	25.121
19.780	25.766
19.830	27.218
19.831	28.024
19.916	22.057
19.918	23.266
20.921	27.216
20.971	28.829
21.819	25.198
21.823	27.617
21.824	28.182
21.826	29.149
21.863	22.617
22.820	27.615
23.907	24.952
23.913	28.984
23.962	29.790
24.862	29.224
26.004	31.157
26.047	28.012
28.090	30.105
28.896	29.700
28.898	30.426
28.943	29.135
29.841	27.198
33.022	28.159
38.106	32.746];
data.tL(:,1) = 365*data.tL(:,1); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AllaLora2000';


%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'preferred temperature 22 C; ';
metaData.bibkey.F1 = 'fishbase'; 
F2 = '50-1100 m deep, usually 150-600 m deep. Bathydemersal, larvae and juveniles are pelagic'; 
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'zygoparous (intermediate between oviparity and viviparity)';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'length-weight: W = 0.014*L^3.091';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '6LJ8Z'; % Cat of Life
metaData.links.id_ITIS = '166787'; % ITIS
metaData.links.id_EoL = '46568099'; % Ency of Life
metaData.links.id_Wiki = 'Helicolenus_dactylopterus'; % Wikipedia
metaData.links.id_ADW = 'Helicolenus_dactylopterus'; % ADW
metaData.links.id_Taxo = '192869'; % Taxonomicon
metaData.links.id_WoRMS = '127251'; % WoRMS
metaData.links.id_fishbase = 'Helicolenus-dactylopterus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Helicolenus_dactylopterus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AllaLora2000'; type = 'Article'; bib = [ ... 
'author = {V. Allain and P. Lorance}, ' ... 
'year = {2000}, ' ...
'title = {AGE ESTIMATION AND GROWTH OF SOME DEEP-SEA FISH FROM THE NORTHEAST {A}TLANTIC {O}CEAN}, ' ...
'journal = {Cybium}, ' ...
'volume = {24}, ' ...
'number = {3, suppl}, '...
'pages = {7--16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/76}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  
'author = {Munk, P. and Nielsen, J. G.}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of {N}orth {S}ea fishes}, ' ...
'publisher = {biofolia}, ' ...
'address = {Frederiksberg, DK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

