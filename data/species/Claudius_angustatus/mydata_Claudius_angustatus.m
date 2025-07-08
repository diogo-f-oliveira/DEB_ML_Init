function [data, auxData, metaData, txtData, weights] = mydata_Claudius_angustatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Claudius_angustatus'; 
metaData.species_en = 'Narrow-bridged musk turtle'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 07];

%% set data
% zero-variate data

data.ab = 95;       units.ab = 'd';    label.ab = 'age at birth';                       bibkey.ab = 'LeglVogt2013';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '95--229 d, depending on diapauze';
data.tp = 5*365;       units.tp = 'd';    label.tp = 'time since birth at puberty for female';  bibkey.tp = 'LeglVogt2013';
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4.5*365;       units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'LeglVogt2013';
  temp.tpm = C2K(28); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 16.1*365;  units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.58; units.Lb = 'cm';   label.Lb = 'carapace length at birth';                 bibkey.Lb = 'LeglVogt2013';
data.Lp = 10; units.Lp = 'cm';  label.Lp = 'carapace length at puberty for females';     bibkey.Lp = 'LeglVogt2013';
data.Lpm = 9.8; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';   bibkey.Lpm = 'LeglVogt2013';
data.Li = 15; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';        bibkey.Li = 'LeglVogt2013';
data.Lim = 16.5; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';       bibkey.Lim = 'LeglVogt2013';

data.Wwb = 3.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                     bibkey.Wwb = 'LeglVogt2013';
data.Wwp = 118.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'LeglVogt2013';
 comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwpm = 90.9; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';       bibkey.Wwpm = 'LeglVogt2013';
 comment.Wwpm = 'based on (Lpm/Lim)^3*Wwim';
data.Wwi = 400; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';        bibkey.Wwi = 'LeglVogt2013';
data.Wwim = 434; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';       bibkey.Wwim = 'LeglVogt2013';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                   bibkey.Ri  = 'LeglVogt2013';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.4 eggs per clutch, 2.5 clutches per yr';
 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hb only'; 
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'opportunistic carnivore';
metaData.bibkey.F1 = 'LeglVogt2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'VTHZ'; % Cat of Life
metaData.links.id_ITIS = '551948'; % ITIS
metaData.links.id_EoL = '795375'; % Ency of Life
metaData.links.id_Wiki = 'Claudius_angustatus'; % Wikipedia
metaData.links.id_ADW = 'Claudius_angustatus'; % ADW
metaData.links.id_Taxo = '48323'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Claudius&species=angustatus'; % ReptileDB
metaData.links.id_AnAge = 'Claudius_angustatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Claudius_angustatus}}';
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
bibkey = 'LeglVogt2013'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {J. M. Legler and R. C. Vogt}, ' ...
'year = {2013}, ' ...
'title  = {Turtles of Mexico; land and freshwater forms}, ' ...
'publisher = {Univ. of Calif. Press, Berkeley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Claudius_angustatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/815713/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/6493/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'encyclopedia'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.encyclopedia.com/environment/encyclopedias-almanacs-transcripts-and-maps/central-american-river-turtles-dermatemydidae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

