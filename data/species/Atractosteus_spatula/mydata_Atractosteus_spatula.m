function [data, auxData, metaData, txtData, weights] = mydata_Atractosteus_spatula

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lepisosteiformes'; 
metaData.family     = 'Lepisosteidae';
metaData.species    = 'Atractosteus_spatula'; 
metaData.species_en = 'Alligator gar'; 
metaData.ecoCode.climate = {'MB', 'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFe', '0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvr', 'biCvb', 'biCvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2014 04 17];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data;
data.ah = 2.5;units.ah = 'd';      label.ah = 'age at hatch';   bibkey.ah = 'seriouslyfish';    
  temp.ah = C2K(28); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'temps for all data are guessed';
data.ab = 8.5;units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'seriouslyfish';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 11*365;  units.ap = 'd'; label.ap = 'age at puberty'; bibkey.ap = 'seriouslyfish';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 70*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Wiki';   
  temp.am = C2K(20);units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0  = 0.2;       units.L0  = 'cm';  label.L0  = 'egg diameter';          bibkey.L0  = 'Clay2004';
data.Lh  = 0.7;       units.Lh  = 'cm';  label.Lh  = 'total length at hatch'; bibkey.Lh  = 'Clay2004';
data.Lb  = 1.35;      units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Clay2004';
data.Li  = 257;       units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwi = 148000;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';

data.Ri  = 1.5e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tW = [ ... % time (d), wet weight (g)
0.027	8.723
1.959	10.099
4.054	11.885
5.905	13.533
8.054	15.796
10.014	18.399
12.000	21.138
13.986	23.809
16.000	26.412
17.986	29.969
20.000	37.888];
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  bibkey.tW = 'Clay2004';
  temp.tW = C2K(28.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';

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

%% Links
metaData.links.id_CoL = 'JJT8'; % Cat of Life
metaData.links.id_ITIS = '201897'; % ITIS
metaData.links.id_EoL = '46582207'; % Ency of Life
metaData.links.id_Wiki = 'Atractosteus_spatula'; % Wikipedia
metaData.links.id_ADW = 'Atractosteus_spatula'; % ADW
metaData.links.id_Taxo = '42476'; % Taxonomicon
metaData.links.id_WoRMS = '279822'; % WoRMS
metaData.links.id_fishbase = 'Atractosteus-spatula'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atractosteus_spatula}}';  
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
bibkey = 'Clay2004'; type = 'PhDthesis'; bib = [ ...  
'author = {T. A. Clay}, ' ...
'year = {2004}, ' ...
'title  = {Growth, survival and cannibalism rates of alligator gar \emph{Atractosteus spatula} in recirculating aquaculture systems.}, ' ...
'school = {Thesis Univ Maryland, Baltimore}, ' ...
'howpublished = {\url{http://www.nicholls.edu/bayousphere/GraduateStudents/TClay/Clay Thesis.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seriouslyfish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seriouslyfish.com/species/atractosteus-spatula/}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flmnh'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.flmnh.ufl.edu/natsci/ichthyology/gallery/Descript/AlligatorGar/AlligatorGar.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
