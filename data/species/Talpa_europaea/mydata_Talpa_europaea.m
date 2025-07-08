function [data, auxData, metaData, txtData, weights] = mydata_Talpa_europaea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Talpidae';
metaData.species    = 'Talpa_europaea'; 
metaData.species_en = 'European mole'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 26]; 

%% set data
% zero-variate data

data.tg = 28;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 31;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 182;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data is unsure';

data.Wwb = 3.25; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 52.1;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 92.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'AnAge';

data.Ri  = 1.1*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
% data.tW = [ ... % time since birth (d), wet weight (g)
% ];
% units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
% temp.tW    = C2K(38.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
% bibkey.tW = 'Ster1975';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5*weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'v and [p_M] are fixed at the values for  T. occidentalis; they are not well-fixed by this data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Moles are unique among mammals because all females of the 4 investigated species (Talpa occidentalis, T. europaea, T. romana, and T. stankovici) have ovotestes instead of simply ovaries';
metaData.bibkey.F1 = 'BarrZuri2004'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54M2V'; % Cat of Life
metaData.links.id_ITIS = '633852'; % ITIS
metaData.links.id_EoL = '1178988'; % Ency of Life
metaData.links.id_Wiki = 'Talpa_europaea'; % Wikipedia
metaData.links.id_ADW = 'Talpa_europaea'; % ADW
metaData.links.id_Taxo = '61343'; % Taxonomicon
metaData.links.id_WoRMS = '1506663'; % WoRMS
metaData.links.id_MSW3 = '13700730'; % MSW3
metaData.links.id_AnAge = 'Talpa_europaea'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Talpa_europaea}}';
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
bibkey = 'Ster1975'; type = 'Article'; bib = [ ... 
'author = {St\v{e}rba O.}, ' ... 
'year = {1975}, ' ...
'title = {Prenatal growth of the mole, \emph{Talpa europaea} {L}inn., 1758}, ' ...
'journal = {Folia Morphol (Praha)}, ' ...
'volume = {23:}, ' ...
'number = {3}, ' ...
'pages = {282--285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BarrZuri2004'; type = 'Article'; bib = [ ... 
'author = {F. J. Barrionuevo and F. Zurita and M. Burgos and R. Jim\''{e}nez}, ' ... 
'year = {2004}, ' ...
'title = {Developmental Stages and Growth Rate of the Mole \emph{Talpa occidentalis} ({I}nsectivora, {M}ammalia)}, ' ...
'doi = {10.1644/BPR-010}, ' ...
'journal = {J. Mammal.}, ' ...
'volume = {85}, ' ...
'number = {1}, ' ...
'pages = {120--125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Talpa_europaea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

