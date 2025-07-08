function [data, auxData, metaData, txtData, weights] = mydata_Sturnella_magna
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Icteridae';
metaData.species    = 'Sturnella_magna'; 
metaData.species_en = 'Eastern meadowlark'; 

metaData.ecoCode.climate = {'Am','BSk','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTa','0iTg','0iTi'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCii', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp 
metaData.data_0     = {'ah'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Marie Trijau'};    
metaData.date_subm = [2020 05 20];              
metaData.email    = {'marie.trijau@ibacon.com'};            
metaData.address  = {'ibacon GmbH'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 13];

%% set data
% zero-variate data

data.ab = 13.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Saun1932';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '13 to 14 days of incubation time for the egg';  
data.tx = 11;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Lany1957';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '10 to 12 days after hatching';  
data.tp = 33;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '10 to 12 days after hatching';  
data.tR = 10.5*30.5;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Jast2012';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '10 to 11 months after hatching';   
data.am = 12.6*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

% data.Wwx = 59.15; units.Wwx = 'g';   label.Wwx = 'wet weight at fledging';    bibkey.Wwx = 'Knap1988'; 
%   comment.Wwx  = 'mean between weight at fledging for monogamous and for polygamous birds'; 
data.Wwb = 5;   units.Wwb = 'g';   label.Wwb = 'wet weight at hatching';    bibkey.Wwb = 'Knap1988';
data.Wwi = 112; units.Wwi = 'g';   label.Wwi = 'wet weight at ultimate state';    bibkey.Wwi = 'Jast2012';
  comment.Wwi = 'maximum weight of S. m. magna females';

data.Ri  = (6*2)/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Lany1957';   
temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max 6 eggs per clutch, 2 clutch per year assumed';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0   4.9
    2   11.3
    6   25.9
    9   44.4];
units.tW   = {'d', 'g'};  label.tW = {'time since hatching', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Knap1988';
  
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
D1 = 'Time between clutches at T is 182.5 days, similarly to some other members of the Icteridae family present in the database; this value is used as parameter t_N (not estimated)';
D2 = 'Males differ from females in zoom factor only'; 
D3 = 'mod_1: v is reduced; food availability taken variable in tW data';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '537YX'; % Cat of Life
metaData.links.id_ITIS = '179034'; % ITIS
metaData.links.id_EoL = '45511136'; % Ency of Life
metaData.links.id_Wiki = 'Sturnella_magna'; % Wikipedia
metaData.links.id_ADW = 'Sturnella_magna'; % ADW
metaData.links.id_Taxo = '58482'; % Taxonomicon
metaData.links.id_WoRMS = '1484598'; % WoRMS
metaData.links.id_avibase = '4A11480B216EBB80'; % avibase
metaData.links.id_birdlife = 'eastern-meadowlark-sturnella-magna'; % birdlife
metaData.links.id_AnAge = 'Sturnella_magna'; % AnAge

%% References
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
bibkey = 'Saun1932'; type = 'phdthesis'; bib = [ ... 
'author = {Saunders, G. B.}, ' ... 
'year = {1932}, ' ...
'title = { A taxonomic revision of the meadowlarks of the genus {S}turnella ({V}ieillot) and the natural history of the eastern meadowlark, \textit{Sturnella magna} ({L}innaeus). }, ' ...
'school = {Cornell Univ., Ithaca}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lany1957'; type = 'misc'; bib = [ ...
'author = {Lanyon, W. E.}, ' ... 
'year = {1957}, ' ...
'title = {The comparative biology of the meadowlarks ({S}turnella) in {W}isconsin}, ' ...
'journal = {Publ. Nuttall Ornithol. Club}, ' ...
'volume = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'misc'; bib = [ ... 
'howpublished= {\url{https://genomics.senescence.info/species/entry.php?species=Sturnella_magna}}, '...
'note = {Last accessed: 2020-05-05}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jast2012'; type = 'misc'; bib = [ ...
'author = {Jaster, L. A.}, ' ... 
'year = {2012}, ' ...
'title = {Eastern Meadowlark (\textit{Sturnella magna}), version 2.0}, ' ...
'institution = {Cornell Lab of Ornithology, Ithaca, NY, USA}, '  ...
'doi = {10.2173/bna.160}']; ...
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Knap1988'; type = 'Article'; bib = [ ... 
'author = {Knapton, R. W.}, ' ... 
'year = {1988}, ' ...
'title = {Nesting success is higher for polygynously mated females than for monogamously mated females in the Eastern Meadowlark}, ' ...
'journal = {The Auk}, ' ...
'volume = {105}, ' ...
'pages = {325-338}'];
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

