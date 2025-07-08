function [data, auxData, metaData, txtData, weights] = mydata_Etmopterus_perryi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Etmopteridae';
metaData.species    = 'Etmopterus_perryi'; 
metaData.species_en = 'Dwarf lanternshark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temperature
metaData.data_0     = {'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 0.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 26];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data;
data.Lb = 5.75;    units.Lb  = 'cm';   label.Lb  = 'total length at birth';  bibkey.Lb  = 'inaturalist';
data.Lp_f = 15.75; units.Lp_f  = 'cm'; label.Lp_f  = 'total length at puberty';bibkey.Lp_f  = 'inaturalist';
  comment.Lp_f = 'for females'; 
data.Lp_m = 17.75; units.Lp_m  = 'cm'; label.Lp_m  = 'total length at puberty';bibkey.Lp_m  = 'inaturalist'; 
  comment.Lp_m = 'for males'; 
data.Li  = 21.5;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'inaturalist';

data.Wwi = (21.2/157)^3*12021; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'guessed from Squalus acanthias: (21.2/157)^3*12021';

data.Ri  = 2.5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'inaturalist';   
  temp.Ri = C2K(9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 10 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.g = 0.7; units.psd.g = '-'; label.psd.g = 'energy investment ratio'; weights.psd.g = 0.3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'aplacental viviparous, smallest shark';
metaData.bibkey.F1 = 'inaturalist'; 
F2 = 'upper continental slope at a depth of 283-439 m'; 
metaData.bibkey.F2 = 'inaturalist'; 
F3 = 'dark brown with a striking and distinctive pattern of black markings on its ventral surface, a continuous or broken, fine black line along the middle of its back; Some of the ventral black markings are composed of light-producing photophores, while others (including the patch behind the pelvic fins) are composed of pigment-containing chromatophores.';
metaData.bibkey.F3 = 'inaturalist'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3BM7W'; % Cat of Life
metaData.links.id_ITIS = '621061'; % ITIS
metaData.links.id_EoL = '46560265'; % Ency of Life
metaData.links.id_Wiki = 'Etmopterus_perryi'; % Wikipedia
metaData.links.id_ADW = 'Etmopterus_perryi'; % ADW
metaData.links.id_Taxo = '106487'; % Taxonomicon
metaData.links.id_WoRMS = '271637'; % WoRMS
metaData.links.id_fishbase = 'Etmopterus-perryi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Etmopterus_perryi}}';  
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
bibkey = 'inaturalist'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.inaturalist.org/taxa/100588-Etmopterus-perryi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
