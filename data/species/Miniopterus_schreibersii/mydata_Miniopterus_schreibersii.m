function [data, auxData, metaData, txtData, weights] = mydata_Miniopterus_schreibersii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Miniopteridae';
metaData.species    = 'Miniopterus_schreibersii'; 
metaData.species_en = 'Common bent-wing bat'; 

metaData.ecoCode.climate = {'BSk', 'BSh', 'BWk', 'Csa'};
metaData.ecoCode.ecozone = {'THp', 'TPa', 'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 28]; 

%% set data
% zero-variate data

data.tg = 100;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 66;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 577;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(37.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 730;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 22*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwx = 12.5;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';        bibkey.Wwx = 'AnAge';
data.Wwi = 13;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litters per yr';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
2.011	3.385
2.012	3.520
2.013	3.629
2.016	3.873
2.019	4.145
6.152	7.077
6.278	7.240
6.280	7.457
6.530	7.593
12.782	11.014
13.138	9.357
13.140	9.493
13.270	10.063
13.273	10.308
13.390	9.629
19.999	11.475
20.114	10.606
20.116	10.851
20.119	11.068
20.245	11.231
20.252	11.937
20.498	11.665
27.945	10.443
28.067	10.145
28.068	10.281
28.075	10.986
28.201	11.095
28.202	11.258
34.925	12.127
34.928	12.344
35.042	11.394
35.044	11.584
35.046	11.801
35.048	11.964
35.054	12.561
35.181	12.778
42.011	11.964
42.013	12.181
42.140	12.452
42.144	12.778
50.096	12.262
50.098	12.534
50.100	12.670
50.102	12.860
60.047	12.670
60.048	12.833
60.051	13.077
69.997	12.995
70.117	12.588
70.118	12.724
70.119	12.833];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SharVais2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;
weights.Wwi = 10 * weights.Wwi;

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
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '43JSW'; % Cat of Life
metaData.links.id_ITIS = '946266'; % ITIS
metaData.links.id_EoL = '1010972'; % Ency of Life
metaData.links.id_Wiki = 'Miniopterus_schreibersii'; % Wikipedia
metaData.links.id_ADW = 'Miniopterus_schreibersii'; % ADW
metaData.links.id_Taxo = '65101'; % Taxonomicon
metaData.links.id_WoRMS = '1049400'; % WoRMS
metaData.links.id_MSW3 = '13802613'; % MSW3
metaData.links.id_AnAge = 'Miniopterus_schreibersii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Miniopterus_schreibersii}}';
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
bibkey = 'SharVais2013'; type = 'Article'; bib = [ ... 
'author = {M. Sharifi and S. Vaissi}, ' ... 
'year = {2013}, ' ...
'title = {Postnatal growth in the Long-fingered Bat, \emph{Miniopterus schreibersii pallidus}, in {I}ran ({C}hiroptera: {M}iniopteridae)}, ' ...
'journal = {Zoology in the Middle East}, ' ...
'volume = {59}, ' ...
'pages = {1--5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Miniopterus_schreibersii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

