function [data, auxData, metaData, txtData, weights] = mydata_Urocitellus_columbianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Urocitellus_columbianus'; 
metaData.species_en = 'Columbia ground squirrel'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t_Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 03];              

%% set data
% zero-variate data

data.tg = 24.5;    units.tg = 'd';     label.tg = 'gestation time';                bibkey.tg = 'ADW';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '23 till 26 d';
data.tx = 40;    units.tx = 'd';     label.tx = 'time since birth at weaning';   bibkey.tx = 'ADW';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(35.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(35.5); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6*365;    units.am = 'd'; label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(35.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data from Urocitellus_richardsonii and uncertain';
  
data.Wwb = 7;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'KoepHoff1981';
data.Wwi = 480;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'ADW';
  comment.Wwi = '201-635 g';

data.Ri  = 7/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.7 pups per litter; 1 litter per yr';

% uni-variate data

% time-length data
data.tL = [ ... % time since birth (d), head+body length (g)
0.179	6.134
3.782	7.541
7.371	8.489
10.588	9.465
15.044	10.529
18.138	11.190
21.479	11.995
24.449	12.627
26.058	13.058
27.914	13.661
30.142	14.379
31.792	16.065
35.766	17.286
38.571	18.262
40.442	19.156
42.896	20.051
45.701	21.082
50.026	21.247
54.000	21.926
57.623	22.334
62.065	22.202
65.688	22.610
69.779	22.639
73.753	22.154
77.844	22.373
81.818	22.268];
units.tL  = {'d', 'cm'};  label.tL = {'time', 'head+body length'};  
temp.tL  = C2K(35.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KoepHoff1981';

% time-weight data
data.tWw = [ ... % time since birth (d), weight (g)
0.376	8.562
5.704	17.789
10.414	28.447
16.489	41.946
21.694	52.600
26.408	65.397
30.266	86.044
32.896	113.117
35.399	138.053
39.785	185.790
42.669	218.566
46.067	267.737
50.265	263.425
58.266	334.663
62.222	335.345
70.166	360.950
74.119	358.067
78.297	338.070
81.999	332.336];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw  = C2K(35.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'KoepHoff1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tWw = 5 * weights.tWw;

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
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7DTRZ'; % Cat of Life
metaData.links.id_ITIS = '930318'; % ITIS
metaData.links.id_EoL = '328002'; % Ency of Life
metaData.links.id_Wiki = 'Urocitellus_columbianus'; % Wikipedia
metaData.links.id_ADW = 'Urocitellus_columbianus'; % ADW
metaData.links.id_Taxo = '5726070'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401015'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urocitellus_columbianus}}';
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
bibkey = 'KoepHoff1981'; type = 'Article'; bib = [ ... 
'author = {J. W. Koeppl and R. S. Hoffmann}, ' ... 
'year = {1981}, ' ...
'title = {Comparative Postnatal Growth of Four Ground Squirrel Species}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {62(1)}, ' ...
'pages = {41-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Urocitellus_columbianus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

