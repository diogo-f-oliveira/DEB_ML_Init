function [data, auxData, metaData, txtData, weights] = mydata_Mycteria_leucocephala

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Ciconiiformes'; 
metaData.family     = 'Ciconiidae';
metaData.species    = 'Mycteria_leucocephala'; 
metaData.species_en = 'Painted stork'; 

metaData.ecoCode.climate = {'A','Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'Urfi2011';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 65;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Urfi2011';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 195;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on Mycteria americana: sexually matury in 3 mnth in captivity';
data.am = 28.6*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 89;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 55;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Urfi2011';
data.Wwi = 2500; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'avibase';
data.Wwim = 3190; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of males';  bibkey.Wwim = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
    0            55
    mean([7 15])  mean([ 144 525])
    mean([6 30])  mean([1073 1249])
    mean([31 45]) mean([1599 1960])
    mean([46 60]) mean([2230 2650])
    mean([61 70]) mean([2833 3008])];    
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Urfi2011'; 
  
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
D2 = 'scaled functional response varies';
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'tW data is inconsistent with tJX data after day 30; additional food intake must have occured';
D5 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '44ZJB'; % Cat of Life
metaData.links.id_ITIS = '561281'; % ITIS
metaData.links.id_EoL = '45518774'; % Ency of Life
metaData.links.id_Wiki = 'Mycteria_leucocephala'; % Wikipedia
metaData.links.id_ADW = 'Mycteria_leucocephala'; % ADW
metaData.links.id_Taxo = '51885'; % Taxonomicon
metaData.links.id_WoRMS = '1558270'; % WoRMS
metaData.links.id_avibase = '547013E26B7D1FBC'; % avibase
metaData.links.id_birdlife = 'painted-stork-mycteria-leucocephala'; % birdlife
metaData.links.id_AnAge = 'Mycteria_leucocephala'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteria_leucocephala}}';
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
bibkey = 'Urfi2011'; type = 'Book'; bib = [ ... 
'doi = {10.1007/978-1-4419-8468-5}, ' ...
'author = {A.J. Urfi}, ' ... 
'year = {2011}, ' ...
'title = {The painted stork; Ecology and Conservation}, ' ...
'publisher = {Springer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=547013E26B7D1FBC&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mycteria_leucocephala}}';
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

