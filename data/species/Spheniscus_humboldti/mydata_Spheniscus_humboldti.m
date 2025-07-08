function [data, auxData, metaData, txtData, weights] = mydata_Spheniscus_humboldti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Spheniscus_humboldti'; 
metaData.species_en = 'Humboldt penguin'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 40;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'DeemHarv1991';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 65;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Value for S. demersus: 60 till 100 d';
data.tp = 195;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Value for S. demersus: 60 till 100 d';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'EoL';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for S. demersus';

data.Wwb = 96;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DeemHarv1991';
data.Wwi = 5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = '3.6 till 5.9 kg';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0.000	96.345
1.047	87.614
1.824	85.942
2.883	86.093
3.941	93.374
4.787	109.538
5.844	123.949
6.831	138.350
7.887	159.891
8.802	183.194
9.857	208.300
10.771	238.733
11.827	263.839
12.953	288.955
13.938	315.834
14.923	340.930
15.908	369.591
16.891	408.947
18.017	437.628
18.861	462.704
19.915	500.287
20.828	534.285
21.953	568.314
22.795	607.650
23.916	673.763
25.038	732.747
25.879	775.647
26.721	813.201
27.839	898.921
28.966	922.255
30.016	983.011];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DeemHarv1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4YV8F'; % Cat of Life
metaData.links.id_ITIS = '174463'; % ITIS
metaData.links.id_EoL = '45512091'; % Ency of Life
metaData.links.id_Wiki = 'Spheniscus_humboldti'; % Wikipedia
metaData.links.id_ADW = 'Spheniscus_humboldti'; % ADW
metaData.links.id_Taxo = '51421'; % Taxonomicon
metaData.links.id_WoRMS = '293019'; % WoRMS
metaData.links.id_avibase = '37FC130FE446358F'; % avibase
metaData.links.id_birdlife = 'humboldt-penguin-spheniscus-humboldti'; % birdlife
metaData.links.id_AnAge = 'Spheniscus_humboldti'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spheniscus_humboldti}}';
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
bibkey = 'DeemHarv1991'; type = 'Article'; bib = [ ... 
'author = {D. C. Deeming and R. L. Harvey and L. Harvey and S. Carey and D. Leuchars}, ' ... 
'year = {1991}, ' ...
'title = {Artificial incubation and hand-rearig of Humboldt penguins \emph{Spheniscus humboldti} at {Birdworld, Farnham}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {30}, ' ...
'pages = {165--173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Spheniscus_humboldti/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049617/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

