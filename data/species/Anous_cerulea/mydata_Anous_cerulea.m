function [data, auxData, metaData, txtData, weights] = mydata_Anous_cerulea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Anous_cerulea'; 
metaData.species_en = 'Blue noddy'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'biMc'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 34;          units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '32 to 35 d. Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 49;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'RauzHarr1984';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 147;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 14.4;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';           bibkey.Ww0 = 'RauzHarr1984';
  comment.Ww0 = 'avibase gives 12 g';
data.Wwb = 5.0;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'RauzHarr1984';
data.Wwi = 57.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'RauzHarr1984';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0  5.0
    7  9.9
   14 23.2
   21 37.6
   28 49.3
   35 57.4
   42 53.3];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'RauzHarr1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;

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
D1 = 'Body temperature guessed';
D2 = 'relative food intake decreases prior to fledging';
D3 = 'Eggs are very heavy, given weight at birth';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4MMQH'; % Cat of Life
metaData.links.id_ITIS = '554390'; % ITIS
metaData.links.id_EoL = '56951156'; % Ency of Life
metaData.links.id_Wiki = 'Procelsterna_cerulea'; % Wikipedia
metaData.links.id_ADW = 'Procelsterna_cerulea'; % ADW
metaData.links.id_Taxo = '53855'; % Taxonomicon
metaData.links.id_WoRMS = '405103'; % WoRMS
metaData.links.id_avibase = 'D021AB6A1D78BCA6'; % avibase
metaData.links.id_birdlife = 'blue-noddy-anous-ceruleus'; % birdlife
metaData.links.id_AnAge = 'Procelsterna_cerulea'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Procelsterna_cerulea}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Procelsterna_cerulea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=D021AB6A1D78BCA6&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RauzHarr1984'; type = 'Article'; bib = [ ... 
'author = {Mark J. Rauzon and Craig S. Harrison and Roger B. Clapp}, ' ... 
'year = {1984}, ' ...
'title = {Breeding Biology of the Blue-Gray Noddy}, ' ...
'journal = {Journal of Field Ornithology}, ' ...
'volume = {55(3)}, ' ...
'pages = {309-321}'];
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

