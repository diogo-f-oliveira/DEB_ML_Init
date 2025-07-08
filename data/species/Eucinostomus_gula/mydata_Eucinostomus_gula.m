 function [data, auxData, metaData, txtData, weights] = mydata_Eucinostomus_gula
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Eucinostomus_gula'; 
metaData.species_en = 'Jenny mojarra'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 21];

%% set data
% zero-variate data;

data.ab = 2.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(25.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Mexi1999';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 11;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 25.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 6.55e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Gerres_oyena: pi/6*0.05^3';
data.Wwp = 4.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on LW data; 0.01096*Lp^3.08, see F1, gives 17.7 g';
data.Wwi = 60;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on LW data; 0.01096*Li^3.08, see F1, gives 235.5 g';

data.Ri  = 1e5/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(25.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Gerris equulus';
  
% uni-variate data
% time-length
data.tL = [ ...    % time since birth (yr), total length (cm)
 0	 1.892
 1	 8.159
 2	12.382
 3	15.070
 4	16.891
 5	17.995
 6	18.894
 7	19.283
 8	19.723
 9	19.857
10	20.144]; 
data.tL(:,1) = 365 * (0.1 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mexi1999';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
5.340	0.421
5.693	0.594
5.899	0.521
5.943	0.448
6.179	0.792
6.385	0.548
6.532	0.744
6.650	0.671
6.797	0.721
6.841	0.745
6.959	0.819
7.209	0.992
7.283	0.796
7.386	1.189
7.430	1.115
7.533	1.091
7.680	0.993
7.754	1.116
7.842	1.043
7.857	1.141
7.857	1.215
7.931	1.338
7.945	1.019
8.004	1.436
8.019	1.338
8.093	1.265
8.137	1.485
8.210	1.339
8.328	1.339
8.387	1.486
8.402	1.732
8.402	1.315
8.519	1.732
8.534	1.389
8.549	1.266
8.608	1.364
8.608	1.634
8.681	1.487
8.696	1.953
8.711	1.708
8.829	1.414
8.858	1.512
8.873	1.954
8.873	1.831
8.917	1.096
8.946	2.101
9.020	2.077
9.064	2.494
9.094	2.322
9.108	1.759
9.108	1.930
9.167	2.127
9.256	1.857
9.270	2.127
9.359	1.857
9.417	2.250
9.506	2.545
9.506	2.912
9.535	2.226
9.550	1.809
9.565	1.711
9.609	1.319
9.653	2.594
9.697	2.300
9.712	2.177
9.844	2.031
9.933	2.571
9.992	3.355
10.006	2.742
10.006	1.933
10.036	2.350
10.036	2.350
10.050	3.110
10.050	3.282
10.109	2.816
10.227	2.768
10.257	3.013
10.271	2.204
10.286	3.283
10.374	2.891
10.374	3.136
10.389	3.210
10.433	2.597
10.448	3.480
10.463	2.425
10.507	4.019
10.536	2.720
10.551	3.039
10.728	3.456
10.742	3.309
10.787	2.623
10.816	3.039
10.816	3.652
10.875	3.334
10.978	3.751
11.022	5.026
11.022	4.462
11.022	3.972
11.037	4.291
11.037	4.168
11.037	3.580
11.228	3.237
11.243	4.046
11.317	3.630
11.375	3.949
11.464	3.851
11.478	3.679
11.493	5.052
11.508	4.439
11.508	4.856
11.523	4.636
11.596	4.072
11.640	4.685
11.685	4.268
11.729	4.514
11.773	4.367
11.788	3.827
11.861	5.078
11.950	4.662
11.979	4.073
12.023	4.932
12.023	4.637
12.053	5.422
12.053	5.103
12.215	5.521
12.215	4.785
12.332	5.006
12.391	6.085
12.465	5.105
12.509	5.865
12.538	5.252
12.715	6.773
12.715	5.572
12.730	4.002
12.759	6.087
12.818	5.425
12.877	5.719
12.921	6.504
13.009	5.891
13.039	4.960
13.039	6.112
13.068	6.382
13.113	6.161
13.216	6.848
13.245	6.309
13.407	6.653
13.422	7.683
13.481	5.844
13.569	6.702
13.628	6.188
13.628	5.648
13.642	6.948
13.642	5.305
13.849	7.292
13.878	5.845
14.128	6.950
14.143	7.832
14.349	8.152
14.364	7.294
15.542	10.608
15.542	9.504
16.454	12.719
16.454	11.763]; 
units.LW = {'d', 'cm'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Mexi1999';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01096*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BTKP'; % Cat of Life
metaData.links.id_ITIS = '169016'; % ITIS
metaData.links.id_EoL = '46580880'; % Ency of Life
metaData.links.id_Wiki = 'Eucinostomus'; % Wikipedia
metaData.links.id_ADW = 'Eucinostomus_gula'; % ADW
metaData.links.id_Taxo = '174216'; % Taxonomicon
metaData.links.id_WoRMS = '159733'; % WoRMS
metaData.links.id_fishbase = 'Eucinostomus-gula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eucinostomus}}';
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
bibkey = 'Mexi1999'; type = 'article'; bib = [ ... 
'author = {Mexicano-Cíntora, G.}, ' ... 
'year = {1999}, ' ...
'title = {Crecimiento y reproducci\''{o}n de la mojarra, \emph{Eucinostomus gula} de {C}elest\''{u}n, {Y}ucat\''{a}n, {M}\''{e}xico}, ' ...
'journal = {Proc. Gulf Carribb. Fish. Inst.}, ' ...
'volume = {45}, ' ...
'pages = {524-536}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Eucinostomus-gula.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
