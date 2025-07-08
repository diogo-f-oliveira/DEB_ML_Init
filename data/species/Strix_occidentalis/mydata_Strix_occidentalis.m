  function [data, auxData, metaData, txtData, weights] = mydata_Strix_occidentalis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Strix_occidentalis'; 
metaData.species_en = 'Spotted Owl'; 

metaData.ecoCode.climate = {'Csa', 'Csb','Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTa'};
metaData.ecoCode.embryo  = {'Tnpf', 'Tncf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp Mexican subspecies GaneBald1993
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR';'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'};  
metaData.data_1     = {};

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Benoit Goussen', 'Marie Trijau'};        
metaData.date_subm = [2020 05 20];                           
metaData.email    = {'benoit.goussen@ibacon.com', 'marie.trijau@ibacon.com'};                 
metaData.address  = {'ibacon GmbH'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 08 30];              
metaData.email_mod_2    = {'starrlight@tecnico.ulisboa.pt'};            
metaData.address_mod_2  = {'University of Lisboa'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 30]; 

%% set data
% zero-variate data
data.ab = 30;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'ForsMesl1984';   
  comment.ab  = 'mean value non sub-species specific'; 
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 35;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ForsMesl1984';   
  comment.tx  = 'mean value non sub-species specific'; 
  temp.tx = C2K(40.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  comment.tp  = 'mean value non sub-species specific'; 
  temp.tp = C2K(40.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;     units.tR = 'd';    label.tR = 'time since birth at first reproduction'; bibkey.tR = 'Mill1985';   
  temp.tR = C2K(40.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'AnAge';    
  comment.am  = 'maximal life-span achieved in captivity. Mean is 15-17 years'; 
  temp.am = C2K(40.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 48.3;   units.Li  = 'cm';   label.Li  = 'ultimate length';    bibkey.Li  = 'Daws1923';   
  comment.Li  = 'max adult size non sub-species specific; range from 466-482 mm'; 

data.Wwb = 48.85; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'GutiFran1995';    
  comment.Wwb  = 'based on egg size, length 50.62 mm (48-55.37), breadth 42.93  mm (40.3-46.87): 2/3*pi*(4.293/2)*(4.293/2)*(5.062)'; 
% data.Wwx = 425;   units.Wwx = 'g';    label.Wwx = 'wet weight at fledging';           bibkey.Wwx = 'GutiFran1995';   
%   comment.Wwx  = 'mean weight at fledging non sub-species specific; range 400-450 g';
data.Wwi = 680;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight female';   bibkey.Wwi = 'GutiFran1995';   
  comment.Wwi  = 'max of the adult weight range reported for Mexican subspecies 569 g (480-680)'; 
data.Wwim = 625;   units.Wwim = 'g';    label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'GutiFran1995';   
  comment.Wwim  = 'max of the adult weight range reported for Mexican subspecies 509 g (449-625)'; 

data.Ri  = 2/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'Wiki';      
  comment.Ri  = '2 eggs per clutch, 1 clutch per yr'; 
  temp.Ri = C2K(40.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'Males are assumed to differ from females by {p_Am} only'; 
D2 = 'Time between clutches at T is 1 year, similarly to all other members of the Strigidae family present in the database; this value is used as parameter t_N (not estimated)';
D3 = ['Delay in onset of embryonic development estimated to be relatively long (25 days), similarly to some other members of the Strigidae family in AmP collection ', ...
    '(see A. otus, A.flammeus, O. senegalensis, A. noctua)']; 
D4 = 'mod_1 v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '532JH'; % Cat of Life
metaData.links.id_ITIS = '177925'; % ITIS
metaData.links.id_EoL = '45510730'; % Ency of Life
metaData.links.id_Wiki = 'Strix_occidentalis'; % Wikipedia
metaData.links.id_ADW = 'Strix_occidentalis'; % ADW
metaData.links.id_Taxo = '54784'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '9B26D30B85765E52'; % avibase
metaData.links.id_birdlife = 'spotted-owl-strix-occidentalis'; % birdlife
metaData.links.id_AnAge = 'Strix_occidentalis'; % AnAge


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ForsMesl1984'; type = 'Article'; bib = [ ...  
'author = {Forsman, E. D. and E. C. Meslow and H. M. Wight}, ' ...
'year = {1984}, ' ...
'title = { Distribution and biology of the Spotted Owl in {O}regon}, ' ... 
'journal = {Wildlife Monographs}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'AnAge'; type = 'misc'; bib = [ ... 
'howpublished= {\url{http://genomics.senescence.info/species/entry.php?species=Strix_occidentalis}}, '...
'note = {Last accessed: 2020-05-05}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'misc'; bib = [ ... 
'howpublished= {\url{https://en.wikipedia.org/wiki/Spotted_owl}}, '...
'note = {Last accessed: 2020-05-05}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Daws1923'; type = 'Book'; bib = [ ...  
'author = {Dawson, L. W.}, ' ...
'year = {1923}, ' ...
'title = {The Birds of {C}alifornia: A Complete, Scientific and Popular Account of the 580 Species and Subspecies of Birds Found in the State}, ' ... 
'volume = {2}, ' ...
'publisher = {South Moulton}, ' ...
'address = {South Moulton, San Diego, CA, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'GutiFran1995'; type = 'misc'; bib = [ ... 
'author = {Gutierrez, R. J. and A. B. Franklin and W. S. Lahaye}, ' ... 
'year = {1995}, ' ...
'title = {Spotted Owl (\textit{Strix occidentalis}), version 2.0.}, ' ...
'institution = {Cornell Lab of Ornithology, Ithaca, NY, USA}, ' ...
'doi =  {10.2173/bna.179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill1985'; type = 'Article'; bib = [ ...  
'author = {Miller, G. S. and K. Nelson and W. C. Wright}, ' ...
'year = {1985}, ' ...
'title = {Two-year-old female Spotted Owl breeds successfully}, ' ... 
'journal = {Western Birds}, ' ...
'volume = {16}, '...
'pages = {69-73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 


