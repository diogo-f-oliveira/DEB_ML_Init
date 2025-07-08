function [data, auxData, metaData, txtData, weights] = mydata_Neotamias_quadrivittatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Neotamias_quadrivittatus'; 
metaData.species_en = 'Colorado chipmunk'; 

metaData.ecoCode.climate = {'BSh','BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 02]; 

%% set data
% zero-variate data

data.tg = 31;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wads1969';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'completed weaning 6-7 wk';
data.tp = 339;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwi = 69.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 5 pups per litter';

% uni-variate data
% time - length
data.tL = [ ... % time (d), head+body length (cm)
0.741	3.872
3.358	4.187
4.771	4.444
6.787	4.781
8.795	4.877
11.008	5.094
13.018	5.230
15.029	5.427
17.246	5.743
19.055	5.880
21.068	6.116
23.083	6.412
25.297	6.649
27.509	6.865
29.724	7.121
30.938	7.438
33.347	7.554
35.164	7.891
37.583	8.286
38.992	8.424
41.205	8.660
43.421	8.956
44.634	9.254
47.051	9.569
48.254	9.588
50.662	9.644
53.071	9.760
54.482	9.957
62.109	10.245
68.541	10.734
72.759	10.967
79.583	11.196
89.011	11.401];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'head+body length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wads1969';

% time-weight data
data.tWw = [ ... % time (d), weight (g)
0.624	2.183
3.640	3.152
5.452	3.937
7.059	4.318
9.276	5.503
11.086	6.085
13.297	6.660
14.914	8.058
17.125	8.633
19.732	8.796
21.342	9.380
23.358	10.569
25.372	11.554
27.182	12.135
29.397	13.117
31.413	14.306
33.822	14.674
35.240	16.076
38.062	17.658
39.272	18.453
41.487	19.434
43.497	20.013
45.323	22.221
47.540	23.407
49.550	23.985
51.170	25.586
52.796	27.798
55.227	30.404
62.080	34.160
68.953	39.949
72.597	43.552
80.039	46.079
89.878	47.754];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Wads1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WYZB'; % Cat of Life
metaData.links.id_ITIS = '930326 '; % ITIS
metaData.links.id_EoL = '289509'; % Ency of Life
metaData.links.id_Wiki = 'Neotamias_quadrivittatus'; % Wikipedia
metaData.links.id_ADW = 'Tamias_quadrivittatus'; % ADW
metaData.links.id_Taxo = '170034'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401199'; % MSW3
metaData.links.id_AnAge = 'Tamias_quadrivittatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neotamias_quadrivittatus}}';
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
bibkey = 'Wads1969'; type = 'Article'; bib = [ ... 
'author = {Carl E. Wadsworth}, ' ... 
'year = {1969}, ' ...
'title = {Reproduction and Growth of \emph{Eutamias quadrivittatus} in Southeastern {U}tah}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {50(2)}, ' ...
'pages = {256-261}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Tamias_quadrivittatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Tamias_quadrimaculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
