function [data, auxData, metaData, txtData, weights] = mydata_Pseudosida_ramosa
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Ctenopoda'; 
metaData.family     = 'Sididae';
metaData.species    = 'Pseudosida_ramosa'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A', 'B'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab_T'; 'ap_T'; 'am_T'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri_T'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 16]; 

%% set data
% zero-variate data

data.ab_25 = 50/24; units.ab_25 = 'd';    label.ab_25 = 'age at birth'; bibkey.ab_25 = 'FreiRoch2006';   
  temp.ab_25 = C2K(25);  units.temp.ab_25 = 'K'; label.temp.ab_25 = 'temperature';
data.ab_30 = 33/24; units.ab_30 = 'd';    label.ab_30 = 'age at birth'; bibkey.ab_30 = 'FreiRoch2006';   
  temp.ab_30 = C2K(30);  units.temp.ab_30 = 'K'; label.temp.ab_30 = 'temperature';
data.tp_25 = 8.34;  units.tp_25 = 'd';    label.tp_25 = 'time since birth at puberty'; bibkey.tp_25 = 'FreiRoch2006';
  temp.tp_25 = C2K(25);  units.temp.tp_25 = 'K'; label.temp.tp_25 = 'temperature';
data.tp_30 = 5.5;   units.tp_30 = 'd';    label.tp_30 = 'time since birth at puberty'; bibkey.tp_30 = 'FreiRoch2006';
  temp.tp_30 = C2K(25);  units.temp.tp_30 = 'K'; label.temp.tp_30 = 'temperature';
data.am_25 = 37.1;    units.am_25 = 'd';    label.am_25 = 'life span'; bibkey.am_25 = 'FreiRoch2006';
  temp.am_25 = C2K(25);  units.temp.am_25 = 'K'; label.temp.am_25 = 'temperature';
data.am_30 = 14.8;    units.am_30 = 'd';    label.am_30 = 'life span'; bibkey.am_30 = 'FreiRoch2006';
  temp.am_30 = C2K(25);  units.temp.am_30 = 'K'; label.temp.am_30 = 'temperature';
  
data.Lb  = 0.075; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'FreiRoch2006';
data.Lp  = 0.16;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'FreiRoch2006';
data.Li  = 0.250; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'FreiRoch2006';

data.Wdi = 110e-6; units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'guess';
   comment.Wdi = 'based on length-weight of Ceriodaphnia dubia: (0.25/0.09832)^3*6.71e-06'; 

data.Ri_25 = 1.35; units.Ri_25 = '#/d';    label.Ri_25 = 'max reprod rate';  bibkey.Ri_25 = 'FreiRoch2006';   
  temp.Ri_25 = C2K(25);  units.temp.Ri_25 = 'K'; label.temp.Ri_25 = 'temperature';
  comment.Ri_25 = 'based on 38.8 neonates during 37.1-8.34 d';
data.Ri_30 = 3; units.Ri_30 = '#/d';    label.Ri_30 = 'max reprod rate';  bibkey.Ri_30 = 'FreiRoch2006';   
  temp.Ri_30 = C2K(30);  units.temp.Ri_30 = 'K'; label.temp.Ri_30 = 'temperature';
  comment.Ri_30 = 'based on 27.8 neonates during 14.8-5.5 d';

% uni-variate data
% time-length
data.tL_25 = [ ... % time since birth (h), length (mm)
1.184	0.750
1.275	0.920
1.366	0.848
1.821	0.840
2.004	0.947
3.005	1.099
3.005	1.170
3.097	1.001
3.916	1.179
4.007	0.992
4.007	1.081
4.007	1.260
5.009	1.403
5.100	1.269
5.100	1.340
5.191	1.179
5.191	1.519
5.920	1.260
5.920	1.430
5.920	1.492
6.011	1.581
6.831	1.492
6.922	1.358
6.922	1.421
7.104	1.662
7.923	1.591
7.923	1.725
8.197	1.350
8.925	1.769
9.016	1.653
9.107	1.582
9.199	1.412
9.745	1.761
9.927	1.832
10.018	1.609
10.747	1.600
10.929	1.832
11.020	1.922
11.931	1.663
11.931	1.922
12.022	1.841
12.022	1.984
12.750	1.931
13.024	1.663
13.024	1.851
13.115	2.083
14.026	1.922
14.026	1.976
14.026	2.074
14.117	1.860
14.754	2.074
14.845	1.860
14.845	1.922
14.845	1.976
15.847	2.074
15.938	1.860
16.029	1.940
16.029	2.003
16.849	1.923
16.849	2.003
16.849	2.074
17.851	2.075
18.033	1.932
18.033	2.003
18.944	1.994
19.035	2.075
19.854	2.102
19.854	2.164
19.854	2.245
19.945	2.004
20.765	2.254
20.856	2.013
20.856	2.084
20.856	2.155
21.858	2.182
21.949	2.004
22.040	2.075
22.040	2.254
22.769	2.165
22.769	2.254
23.042	2.093
23.770	2.254
23.862	2.085
23.862	2.183
24.863	2.103
24.863	2.237
24.954	2.174
25.865	2.103
25.865	2.246
25.956	2.183
26.867	2.174
26.958	2.085
26.958	2.246
27.322	2.335
27.778	2.344
27.869	2.184
27.869	2.237
28.780	2.184
28.780	2.237
28.780	2.327
29.872	2.237
29.872	2.336
29.964	2.193
30.874	2.157
30.874	2.345
31.056	2.247
31.603	2.175
31.694	2.265
31.876	2.327
32.787	2.256
32.787	2.336
33.698	2.229
33.789	2.417
33.880	2.310
34.973	2.426
35.064	2.328
35.792	2.426
35.883	2.346
36.703	2.346
36.703	2.426
37.523	2.328
37.887	2.426
38.616	2.319
38.616	2.427
39.526	2.328
39.709	2.436
40.710	2.445
41.985	2.490
42.896	2.499
43.898	2.490
44.718	2.499
45.811	2.508
46.721	2.508
47.814	2.500];
data.tL_25(:,2) = data.tL_25(:,2)/ 10; % convert mm to cm
units.tL_25   = {'d', 'cm'};  label.tL_25 = {'time since birth', 'length', '25 C'};  
temp.tL_25    = C2K(25);  units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'FreiRoch2006'; 
%
data.tL_30 = [ ... % time since birth (h), length (mm)
0.957	0.769
0.995	0.709
1.885	0.856
1.922	0.942
2.032	1.029
2.957	1.366
2.961	1.037
2.997	1.176
2.998	1.098
3.886	1.444
3.958	1.582
3.962	1.262
4.923	1.703
4.965	1.366
5.034	1.738
5.075	1.444
5.888	1.850
5.891	1.617
5.924	1.928
5.963	1.764
5.964	1.703
6.894	1.677
6.929	1.859
6.967	1.764
7.040	1.919
7.931	1.937
7.935	1.677
8.972	2.006
9.012	1.772
9.047	1.937
9.048	1.867
9.903	1.841
9.974	2.075
10.013	1.919
10.050	2.006
10.904	2.092
10.980	1.911
11.018	1.859
11.053	2.006
11.908	2.014
11.981	2.153
11.982	2.092
12.021	1.928
12.949	1.997
12.984	2.170
12.988	1.911
13.023	2.075
13.917	1.919
13.951	2.179
13.952	2.110
13.990	2.023
14.956	2.032
15.029	2.187
15.884	2.179
16.888	2.179];
data.tL_30(:,2) = data.tL_30(:,2)/ 10; % convert mm to cm
units.tL_30   = {'d', 'cm'};  label.tL_30 = {'time since birth', 'length', '30 C'};  
temp.tL_30    = C2K(30);  units.temp.tL_30 = 'K'; label.temp.tL_30 = 'temperature';
bibkey.tL_30 = 'FreiRoch2006'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_25 = 3 * weights.tL_25;
weights.tL_30 = 3 * weights.tL_30;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_30','tL_25'}; subtitle1 = {'Data at 30, 25 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';     
% metaData.discussion = struct('D1', D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);
 
%% Links
metaData.links.id_CoL = '35BRM'; % Cat of Life
metaData.links.id_ITIS = '83857'; % ITIS
metaData.links.id_EoL = '338940'; % Ency of Life
metaData.links.id_Wiki = 'Diaphanosoma'; % Wikipedia
metaData.links.id_ADW = 'Diaphanosoma_senegal'; % ADW
metaData.links.id_Taxo = '351871'; % Taxonomicon
metaData.links.id_WoRMS = '1302661'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FreiRoch2006'; type = 'Article'; bib = [ ... 
'author = {Freitas, E. C. and Rocha, O}, ' ... 
'year = {2006}, ' ...
'title = {The life cycle of \emph{Pseudosida ramosa}, {D}aday 1904, an endemic Neotropical cladoceran}, ' ...
'journal = {Acta Limnol. Bras.}, ' ...
'volume = {18(34)}, ' ...
'pages = {293-303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

