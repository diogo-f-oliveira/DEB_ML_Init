function [data, auxData, metaData, txtData, weights] = mydata_Phoenicopterus_roseus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Phoenicopteriformes'; 
metaData.family     = 'Phoenicopteridae';
metaData.species    = 'Phoenicopterus_roseus'; 
metaData.species_en = 'Greater flamingo'; 

metaData.ecoCode.climate = {'B', 'C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iS'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 28.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BattJarr2006';   
  temp.ab = C2K(37.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from BechJoha1979';
data.tx = 36;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BattJarr2006';   
  temp.tx = C2K(39.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 108;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'livescience';
  temp.tR = C2K(39.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 44*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 76;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BattJarr2006';
data.Wwi = 3000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '2 till 4 kg';

data.Ri = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
temp.Ri = C2K(39.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
1.004	92.171
1.975	76.507
3.068	74.334
4.040	74.400
5.012	83.455
5.984	94.757
6.957	108.307
8.009	110.626
9.063	130.922
9.954	146.713
11.008	164.762
11.980	178.312
13.034	200.855
14.047	225.643
14.939	245.929
16.033	263.981
17.006	291.013
18.059	309.063
19.032	336.095
20.045	358.636
21.018	387.916
21.951	414.946
23.126	444.239
23.977	469.016
25.072	507.293
26.005	538.817
26.978	572.591
28.032	606.371
28.883	635.643
30.018	667.181
30.992	703.202
31.964	725.740
33.018	757.272
34.073	793.299];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(39.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BattJarr2006';
  
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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4GKQ5'; % Cat of Life
metaData.links.id_ITIS = '824111'; % ITIS
metaData.links.id_EoL = '45513553'; % Ency of Life
metaData.links.id_Wiki = 'Phoenicopterus_roseus'; % Wikipedia
metaData.links.id_ADW = 'Phoenicopterus_roseus'; % ADW
metaData.links.id_Taxo = '1683860'; % Taxonomicon
metaData.links.id_WoRMS = '212708'; % WoRMS
metaData.links.id_avibase = '0F9B5174A8ACF737'; % avibase
metaData.links.id_birdlife = 'greater-flamingo-phoenicopterus-roseus'; % birdlife
metaData.links.id_AnAge = 'Phoenicopterus_roseus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoenicopterus_roseus}}';
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
bibkey = 'BattJarr2006'; type = 'Article'; bib = [ ... 
'author = {M. Batty and N. S. Jarrett and N. Forbes and M. J. Brown and S. Standley and T. Richardson and S. Oliver and B. Ireliand and K. P. Chalmers and I. Fraser}, ' ... 
'year = {2006}, ' ...
'title = {Hand-rearing Greater flamingos \emph{Phoenicopterus ruber roseus} for translocation from {WWT Slimbridge to Auckland Zoo}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {40}, ' ...
'pages = {261-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049150/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phoenicopterus_roseus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'livescience'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.livescience.com/27322-flamingos.html}}';
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

