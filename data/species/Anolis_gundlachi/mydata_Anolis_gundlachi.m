function [data, auxData, metaData, txtData, weights] = mydata_Anolis_gundlachi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Dactyloidae';
metaData.species    = 'Anolis_gundlachi'; 
metaData.species_en = 'Yellow-chinned Anole'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney', 'Ray Huey'};  
metaData.date_subm = [2019 06 30];
metaData.email    = {'mrke@unimelb.edu.au'};
metaData.address  = {'School of BioSciences, University of Melbourne, 3010, Australia'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 06 30];

%% set data
% zero-variate data

data.ab = 43;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'Sang2008';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.ap = data.ab+269; units.ap = 'd'; label.ap = 'age at puberty'; bibkey.ap = 'Andr1976';
  temp.ap = C2K(23); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '';
data.am = 3*365; units.am = 'd'; label.am = 'life span'; bibkey.am = 'Rive1998';
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 1.5; units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Stew1996'; 
  comment.Lb = 'hatchling A. gundlachi in belly of a coqui frog!';
data.Lp = 4; units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'Huey2019'; 
data.Li = 5; units.Li  = 'cm';  label.Li  = 'SVL length';   bibkey.Li  = 'Andr1976';

data.Wwb = 3.9846E-05*(data.Lb*10)^2.8629;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'Stew1996','Oter2012'};
  comment.Wwb = 'based on Lb, using F1';
data.Wwp = 3.9846E-05*(data.Lp*10)^2.8629;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'Huey2019','Oter2012'};
  comment.Wwp = 'based on Lp, using F1';
data.Wwi = 3.9846E-05*(data.Li*10)^2.8629; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'Andr1976','Oter2012'};
  comment.Wwi = 'based on Li, using F1';
data.Ri  = 18/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Eale2008';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'pers. obs. by Eales for A. cristatellus (every 2 weeks for 8 months of year)';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 3.9846e-5*(Li in mm)^2.8629; from regression of 573 individuals from Hacienda Carabal in 2012';
metaData.bibkey.F1 = 'Oter2012'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '675NH'; % Cat of Life
metaData.links.id_ITIS = '173894'; % ITIS
metaData.links.id_EoL = '13798'; % Ency of Life
metaData.links.id_Wiki = 'Anolis_gundlachi'; % Wikipedia
metaData.links.id_ADW = 'Anolis_gundlachi'; % ADW
metaData.links.id_Taxo = '249822'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anolis&species=gundlachi'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


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
bibkey = 'Sang2008'; type = 'Article'; bib = [ ... 
'author = {Sanger, Thomas J. and Hime, Paul M. and Johnson, Michele A. and Diani, Jack}, ' ... 
'year = {2008}, ' ...
'title = {Laboratory protocols for husbandry and embryo collection of \textit{{Anolis}} lizards}, ' ...
'pages = {58-63}, ' ...
'volume = {39}, ' ...
'journal = {Herpetological Review}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Andr1976'; type = 'Article'; bib = [ ... 
'author = {Andrews, Robin M.}, ' ... 
'year = {1976}, ' ...
'title = {Growth Rate in Island and Mainland {A}noline Lizards}, ' ...
'pages = {477-482}, ' ...
'volume = {1976}, ' ...
'journal = {Copeia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rive1998'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Rivero, Juan A.}, ' ...
'year = {1998}, ' ...
'title  = {Los Anfibios y Reptiles de {P}uerto {R}ico}, ' ...
'publisher = {Editorial de la Universidad de Puerto Rico, San Juan, Puerto Rico}, '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stew1996'; type = 'BookSection'; bib = [ ... 
'booktitle = {Food Web of a Tropical Rain Forest}, ' ... 
'editor = {D. P. Reagan and R. B. Waide}, ' ...
'publisher = {University of Chicago Press, Chicago}, ' ...
'author = {Stewart, Margaret M. and Woolbright, Lawrence L.}, ' ... 
'year = {1996}, ' ...
'title = {Amphibians}, ' ...
'pages = {273-320}, ' ...
'volume = {9, Chapter 8}, '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eale2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1365-294X.2007.03684.x}, ' ... 
'author = {Eales, J. and Thorpe, R. S. and Malhotra, A.}, ' ... 
'year = {2008}, ' ...
'title = {Weak founder effect signal in a recent introduction of {C}aribbean \textit{Anolis}}, ' ...
'pages = {2061-2071}, ' ...
'volume = {17}, ' ...
'journal = {Molecular Ecology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Huey2019'; type = 'Misc'; bib = [ ...
'author = {Ray Huey}, ' ...     
'year = {2019}, ' ...
'howpublished = {Unpublished measurements}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Oter2012'; type = 'Misc'; bib = [ ...
'author = {Luisa Otero}, ' ...     
'year = {2012}, ' ...
'howpublished = {Unpublished measurements}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



