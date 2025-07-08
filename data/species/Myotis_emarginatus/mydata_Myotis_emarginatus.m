function [data, auxData, metaData, txtData, weights] = mydata_Myotis_emarginatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Myotis_emarginatus'; 
metaData.species_en = 'Geoffroy''s bat';

metaData.ecoCode.climate = {'BSk','Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 29]; 

%% set data
% zero-variate data

data.tg = 49;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 456;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22.7*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'EghbShar2018';
data.Wwi = 8.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'EghbShar2018';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
0.773	2.964
0.838	2.643
0.966	3.250
0.967	2.536
0.968	2.482
0.969	2.125
1.030	2.839
1.031	2.786
1.032	2.250
1.033	2.036
1.034	1.714
1.096	3.107
1.160	2.411
3.738	3.339
3.802	4.518
3.867	3.750
3.931	4.232
3.932	3.464
3.996	3.946
3.997	2.964
4.060	3.589
4.061	3.268
4.125	4.054
4.126	3.196
7.863	5.250
7.864	4.964
7.865	4.464
7.927	4.268
7.991	4.750
8.120	5.679
8.121	4.589
8.122	4.125
8.185	5.411
8.186	5.071
11.857	4.893
11.858	5.036
11.859	5.393
11.860	5.607
11.861	5.750
11.923	4.196
11.924	5.911
11.987	5.286
12.116	5.482
12.245	5.179
15.918	5.679
15.983	5.446
15.984	5.357
15.985	5.179
16.047	6.768
16.048	6.286
16.049	6.125
16.050	5.536
16.112	5.857
16.113	5.089
19.850	6.554
19.914	6.143
19.978	5.661
19.979	5.893
20.107	6.375
20.108	6.821
26.810	6.750
26.811	6.339
27.068	7.107
27.069	6.679
27.070	6.393
27.132	6.911
33.898	6.446
33.899	6.714
33.963	7.143
34.028	7.518
34.092	7.357
39.956	7.214
39.957	7.036
39.958	6.893
40.021	6.714
40.150	7.696
40.151	7.393
40.215	7.786
46.853	6.821
46.982	7.339
46.983	7.500
47.046	7.768
47.111	7.179];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MehdEghb2018';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '8LZVW'; % Cat of Life
metaData.links.id_ITIS = '632015'; % ITIS
metaData.links.id_EoL = '327583'; % Ency of Life
metaData.links.id_Wiki = 'Myotis_emarginatus'; % Wikipedia
metaData.links.id_ADW = 'Myotis_emarginatus'; % ADW
metaData.links.id_Taxo = '64683'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802384'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myotis_emarginatus}}';
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
bibkey = 'EghbShar2018'; type = 'Article'; bib = [ ... 
'doi = {10.3106/ms2017-0077}, ' ...
'author = {Eghbali, H. and Sharifi, M.}, ' ... 
'year = {2018}, ' ...
'title = {Postnatal Growth, Age Estimation, and Wing Development in {G}eoffroy’s Bat \emph{Myotis emarginatus} ({C}hiroptera: {V}espertilionidae)}, ' ...
'journal = {Mammal Study}, ' ...
'volume = {43(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDBarr1993'; type = 'Book'; bib = [ ...  
'author = {David MacDonald and Priscilla Barrett}, ' ...
'year = {1993}, ' ...
'title  = {Mammals of Britain and Europe}, ' ...
'publisher = {HarperCollins, London}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Myotis_emarginatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

