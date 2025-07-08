function [data, auxData, metaData, txtData, weights] = mydata_Neomys_fodiens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Neomys_fodiens'; 
metaData.species_en = 'Eurasian water shrew'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 04 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 04 28]; 

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 32;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 106;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.1*365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.78; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 10;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 16;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 15 - 19 g';

data.Ri  = 5*1.8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.042	0.665
2.001	1.094
3.118	1.442
4.000	2.029
4.882	2.576
6.084	3.279
6.964	3.748
7.933	4.808
8.895	5.355
9.937	6.020
10.662	6.687
11.627	7.511
12.827	8.095
13.705	8.445
14.830	9.268
15.857	8.984
16.823	9.847
17.781	10.196
18.738	10.506
19.767	10.341
20.730	11.006
21.840	10.920
22.798	11.269
23.750	11.223
24.865	11.492
25.810	11.051
26.848	11.439
27.714	10.999
28.749	11.189
29.866	11.537
30.587	11.967
31.783	12.354
32.743	12.783
33.061	12.820
33.537	12.817
33.776	12.894
34.812	13.164
35.599	12.763
36.803	13.585
37.840	13.894
38.715	14.047
39.667	14.040
40.860	14.151
41.897	14.539
42.691	14.533
43.639	14.250
44.842	15.033
45.793	14.987
46.825	14.980
47.858	15.052
48.726	14.730
49.848	15.434
50.804	15.664
51.839	15.855
52.714	15.967
53.820	15.683
54.843	15.123
55.879	15.393
56.916	15.702
57.876	16.170
58.584	15.809
59.863	16.393
60.802	15.557
61.836	15.669
62.722	16.493
63.834	16.564
65.743	16.788];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mich1987';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Actual growth exceeds prediction somewhat till 30 d, which is at weaning';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Like most shrew, they produce venom';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '46NDN'; % Cat of Life
metaData.links.id_ITIS = '633776'; % ITIS
metaData.links.id_EoL = '1178936'; % Ency of Life
metaData.links.id_Wiki = 'Neomys_fodiens'; % Wikipedia
metaData.links.id_ADW = 'Neomys_fodiens'; % ADW
metaData.links.id_Taxo = '60878'; % Taxonomicon
metaData.links.id_WoRMS = '1349989'; % WoRMS
metaData.links.id_MSW3 = '13700434'; % MSW3
metaData.links.id_AnAge = 'Neomys_fodiens'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neomys_fodiens}}';
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
bibkey = 'Mich1987'; type = 'Article'; bib = [ ... 
'author = {Michalak, I.}, ' ... 
'year = {2009}, ' ...
'title = {Growth and postnatal development of the {E}uropean water shrew}, ' ...
'journal = {Acta Theriologica}, ' ...
'volume = {32}, ' ...
'pages = {261-288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Neomys_fodiens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

