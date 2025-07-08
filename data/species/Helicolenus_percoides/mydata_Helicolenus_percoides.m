function [data, auxData, metaData, txtData, weights] = mydata_Helicolenus_percoides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Helicolenus_percoides'; 
metaData.species_en = 'Red gurnard perch'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 42*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.1; units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'fishbase'; 
data.Lp  = 23;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 47;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 3.2e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.03730*(Li)^2.95, see F4';

data.Ri  = 2e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(15);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
0.889	8.374
0.970	13.076
1.131	6.999
1.939	8.033
1.939	9.295
1.939	15.028
1.939	16.405
2.747	24.320
2.828	15.948
2.909	12.967
2.909	13.999
2.909	14.802
2.909	22.141
2.990	9.986
2.990	10.903
2.990	11.935
2.990	18.243
2.990	19.160
3.798	19.850
3.798	20.768
3.798	21.915
3.879	17.901
3.879	23.062
3.960	13.085
3.960	14.002
3.960	17.099
4.121	15.952
4.768	23.064
5.010	20.771
5.172	17.102
5.172	22.263
5.253	23.066
5.253	24.442
5.414	22.034
5.818	25.131
6.061	16.646
6.061	17.678
6.061	18.595
6.061	19.627
6.061	15.155
6.061	23.985
6.222	25.706
6.303	22.610
6.788	23.643
6.788	24.675
6.949	21.350
7.030	18.025
7.030	19.860
7.111	22.497
7.192	25.938
7.515	24.448
7.838	29.954
7.919	21.009
8.000	22.729
8.000	27.202
8.000	28.463
8.000	31.101
8.000	33.968
8.081	25.253
8.081	23.532
8.889	25.370
8.889	26.402
9.051	22.044
9.051	27.320
9.051	28.237
9.859	33.056
9.939	29.042
9.939	34.088
10.020	22.965
10.020	24.455
10.020	26.176
10.020	27.896
10.667	33.058
10.747	34.549
10.909	32.141
10.990	28.013
10.990	28.701
10.990	29.733
10.990	30.536
10.990	31.109
11.152	27.211
11.879	27.098
11.960	25.149
11.960	29.621
11.960	28.704
12.040	33.177
12.040	35.012
12.040	35.929
12.283	27.558
12.929	27.216
13.010	34.900
13.010	33.753
13.010	32.721
13.010	31.803
13.010	31.115
13.010	29.968
13.010	28.248
13.899	30.086
13.899	29.168
13.899	38.228
13.980	35.820
14.061	33.985
14.141	32.265
14.949	37.428
15.030	32.268
15.030	35.020
15.111	29.172
15.111	31.007
16.081	33.532
16.081	32.271
16.162	36.170
16.970	30.095
17.131	36.288
17.293	39.270
17.859	36.404
17.939	35.373
18.101	38.240
18.101	39.387
18.990	33.082
18.990	34.687
18.990	35.834
18.990	37.096
21.010	34.349
21.010	32.285
21.010	30.680
21.818	37.104
21.818	38.251
23.111	38.484
23.758	37.109
23.919	31.261
24.889	39.750
25.859	39.294
26.828	38.150
26.990	36.087
28.202	39.186];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr 
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PaulHorn2009';
comment.tL_f = 'data for females at east coast';
%
data.tL_m = [ ...
0.945	6.858
0.945	8.296
0.945	13.164
1.732	13.053
2.047	9.181
2.126	7.854
2.126	14.159
2.756	17.035
2.835	15.376
2.835	16.040
2.835	18.142
2.835	18.695
2.835	19.469
2.913	9.956
2.913	11.062
2.913	11.947
2.913	19.912
2.913	20.907
2.913	21.792
2.992	13.274
3.622	16.925
3.701	22.124
3.937	12.058
3.937	22.788
4.016	19.912
4.016	23.673
4.094	14.491
4.094	15.376
4.094	21.239
4.803	19.580
4.803	21.239
4.882	24.115
4.961	16.372
5.039	17.035
5.039	18.142
5.118	22.677
5.276	20.465
5.276	13.827
5.276	15.044
5.669	23.341
5.827	26.991
5.906	22.013
5.906	25.000
5.984	20.022
6.693	23.230
6.850	19.912
6.850	29.978
6.929	25.111
6.929	27.876
7.795	30.088
7.874	23.009
7.874	24.226
7.874	25.111
7.874	28.319
7.874	27.102
7.874	26.106
7.953	19.248
7.953	30.973
7.953	31.858
8.031	33.407
8.898	28.208
8.898	30.088
8.898	30.752
8.898	31.195
8.976	26.106
9.055	26.991
9.764	30.973
9.764	30.088
9.764	29.314
9.764	33.186
9.921	34.292
9.921	36.173
10.000	22.013
10.079	19.912
10.079	25.000
10.472	31.858
10.630	30.752
10.709	29.204
10.709	33.186
10.866	35.066
11.024	30.088
11.654	35.398
11.732	24.889
11.732	36.836
11.811	34.181
11.890	38.053
11.969	31.416
11.969	30.752
12.598	34.071
12.598	30.199
12.677	35.177
12.756	36.283
12.835	30.973
12.913	40.155
12.992	32.301
13.701	29.093
13.858	36.836
13.858	38.938
13.858	40.155
14.173	32.301
14.803	33.850
14.803	39.823
14.882	31.084
14.882	35.730
14.882	37.058
14.882	42.146
14.961	38.053
15.748	34.071
15.748	34.845
15.748	36.283
15.748	40.929
15.906	37.058
15.984	38.827
16.693	29.204
16.929	31.084
17.008	37.832
17.008	38.717
17.008	39.381
17.008	42.035
17.795	37.168
19.685	36.173
19.843	40.044
19.843	42.146
20.000	37.942
20.787	41.150
20.866	37.168
21.102	38.938
21.811	41.150
22.835	34.071
22.835	34.845
22.913	36.062
23.937	41.150
23.937	42.920
24.803	38.053
24.882	39.823
24.961	41.593
25.591	38.938
25.748	40.265
25.748	40.929
25.906	42.257
26.772	47.124
27.717	44.027
27.874	39.159
28.976	39.159
28.976	40.265
28.976	35.177
34.961	48.894];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PaulHorn2009';
comment.tL_m = 'data for males at east coast';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'preferred temperature 10.5 to 16.6 C; ';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; demersal; depth range 50 - 750 m. Subtropical;'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Larvae stay within the female fish until they are approximately 1 mm long before they are released into the water';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'length-weight: W in g  = 0.03730*(TL in cm)^2.95';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '3K8BF'; % Cat of Life
metaData.links.id_ITIS = '166791'; % ITIS
metaData.links.id_EoL = '46568108'; % Ency of Life
metaData.links.id_Wiki = 'Helicolenus_percoides'; % Wikipedia
metaData.links.id_ADW = 'Helicolenus_percoides'; % ADW
metaData.links.id_Taxo = '176199'; % Taxonomicon
metaData.links.id_WoRMS = '274770'; % WoRMS
metaData.links.id_fishbase = 'Helicolenus-percoides'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Helicolenus_percoides}}';
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
bibkey = 'PaulHorn2009'; type = 'Article'; bib = [ ... 
'author = {L. J. Paul and P. L. Horn}, ' ... 
'year = {2009}, ' ...
'title = {Age and growth of sea perch (\emph{Helicolenus percoides}) from two adjacent areas off the east coast of {S}outh {I}sland, {N}ew {Z}ealand}, ' ...
'journal = {Fisheries Research 95}, ' ...
'volume = {95}, ' ...
'pages = {169-180}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Helicolenus-percoides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

