function [data, auxData, metaData, txtData, weights] = mydata_Synaptomys_cooperi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Synaptomys_cooperi'; 
metaData.species_en = 'Southern bog lemming'; 

metaData.ecoCode.climate = {'Dfc', 'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iThh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.8); % K, body temp
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

data.tg = 23;    units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 23;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 35;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Wiki';
  temp.tp = C2K(36.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for male';
data.am = 2.5*365;    units.am = 'd'; label.am = 'life span';                  bibkey.am = 'AnAge';   
  temp.am = C2K(36.8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data is uncertain';

data.Wwb = 3.46;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 20;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 27;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';

data.Ri  = 3*2.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 2.5 litters per yr';

  % univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.606	3.888
0.808	3.627
1.414	4.110
1.414	3.943
2.020	4.091
2.222	4.488
3.030	5.181
3.838	5.579
4.242	5.925
5.859	5.682
6.061	7.538
6.667	7.365
6.869	8.742
7.273	7.064
7.273	6.119
8.081	9.241
9.293	9.723
10.101	7.465
10.303	10.325
10.303	9.239
10.505	8.902
11.111	10.915
11.919	10.914
11.919	11.326
13.333	10.712
15.556	15.229
16.364	15.950
16.364	12.535
16.364	12.191
16.970	11.372
18.182	22.159
18.182	20.198
19.596	18.752
19.798	21.152
22.020	22.774
22.424	20.376
22.424	19.726
23.838	19.182
24.848	22.452
25.253	24.291
28.283	25.200
28.283	23.948
29.091	26.638
30.303	26.883
31.717	26.020
34.343	25.066
34.343	26.377
35.152	30.448
37.576	26.367
39.596	29.055
41.616	27.604
42.626	29.863
45.455	29.578
48.485	29.159
53.333	30.809
55.556	30.376
60.808	30.926
62.626	32.236
67.071	34.379
69.091	31.040
73.939	34.193
76.162	32.940
81.414	35.618
83.030	33.685
88.081	36.256
90.101	34.287
94.949	34.748
102.222	34.718
109.091	33.896
115.758	37.159
123.232	37.127];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(37.8);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Conn1957';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7WYFB'; % Cat of Life
metaData.links.id_ITIS = '180324'; % ITIS
metaData.links.id_EoL = '328421'; % Ency of Life
metaData.links.id_Wiki = 'Synaptomys_cooperi'; % Wikipedia
metaData.links.id_ADW = 'Synaptomys_cooperi'; % ADW
metaData.links.id_Taxo = '62597'; % Taxonomicon
metaData.links.id_MSW3 = '13000344'; % Mammal Spec World
metaData.links.id_AnAge = 'Synaptomys_cooperi'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Synaptomys_cooperi}}';
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
bibkey = 'Conn1957'; type = 'phdthesis'; bib = [ ... 
'author = {Conner, Paul F.}, ' ... 
'year = {1957}, ' ...
'title = {The lide history and ecology of the bog lemming, \emph{Synaptomys cooperi}, in Southern New Jersey}, ' ...
'school = {Michigan State University of Agriculture and Applied Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Synaptomys_cooperi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

