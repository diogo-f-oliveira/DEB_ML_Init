function [data, auxData, metaData, txtData, weights] = mydata_Dipodomys_nitratoides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Heteromyidae';
metaData.species    = 'Dipodomys_nitratoides'; 
metaData.species_en = 'Fresno kangaroo rat'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 02];              

%% set data
% zero-variate data

data.tg = 34;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 27;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 88;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data is uncertain';

data.Wwb = 3.18;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 20;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 35.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2*2.3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.3 pups per litter; assumed 2 litters per yr';
   
% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.668	3.985
1.519	3.668
1.521	3.983
2.382	5.135
2.588	3.980
3.444	4.398
3.444	4.398
3.448	5.027
4.306	5.655
4.948	5.968
5.599	7.645
5.603	8.169
5.606	8.589
6.452	7.643
6.455	8.062
6.872	6.698
7.737	8.374
8.616	11.938
8.807	8.791
8.811	9.421
8.814	9.840
8.821	10.784
9.039	11.518
10.533	11.619
10.754	12.773
10.927	7.003
12.244	12.350
12.248	12.874
12.426	7.944
12.455	12.034
12.692	15.286
13.504	9.514
13.971	15.283
14.140	9.093
14.387	13.813
14.605	14.442
15.043	16.014
16.331	17.165
16.332	17.375
16.536	16.011
16.742	15.066
16.988	19.576
17.195	18.737
18.890	17.159
18.893	17.684
18.909	19.886
18.914	20.516
19.324	18.207
20.603	18.099
20.606	18.519
20.609	19.043
20.620	20.617
20.623	20.931
20.626	21.351
22.317	19.249
22.546	21.451
22.548	21.766
22.755	20.822
23.164	18.408
23.384	19.352
23.388	19.876
23.595	19.036
24.899	22.390
24.902	22.914
25.107	21.760
25.538	22.389
25.961	21.863
27.462	23.013
27.464	23.328
27.896	24.061
31.951	24.471
33.430	22.475
33.435	23.209
33.440	23.944
35.575	24.148
35.583	25.407
35.993	22.994
36.005	24.672
36.421	23.202
39.002	26.343
39.422	25.293
39.424	25.713
42.008	29.063
42.019	30.742
44.976	26.644
46.484	28.738
46.691	27.899
46.706	29.997
46.916	29.472
59.099	33.219
66.785	34.460
67.197	32.361
77.461	36.114
90.491	39.020
90.899	36.397
96.498	44.041
97.309	38.165
137.217	41.848
141.894	39.740];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'EiseIsaa1963';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature ia assumed to be that of Dipodomys merriami';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '36PMZ'; % Cat of Life
metaData.links.id_ITIS = '203488'; % ITIS
metaData.links.id_EoL = '328114'; % Ency of Life
metaData.links.id_Wiki = 'Dipodomys_nitratoides'; % Wikipedia
metaData.links.id_ADW = 'Dipodomys_nitratoides'; % ADW
metaData.links.id_Taxo = '88480'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12700067'; % MSW3
metaData.links.id_AnAge = 'Dipodomys_nitratoides'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipodomys_nitratoides}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dipodomys_nitratoides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EiseIsaa1963'; type = 'Article'; bib = [ ...  
'doi = {10.2307/1377168}, ' ...
'author = {Eisenberg, J. F., & Isaac, D. E.}, ' ...
'year = {1963}, ' ...
'title  = {The Reproduction of Heteromyid Rodents in Captivity}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {44(1)}, ' ...
'pages = {61-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

