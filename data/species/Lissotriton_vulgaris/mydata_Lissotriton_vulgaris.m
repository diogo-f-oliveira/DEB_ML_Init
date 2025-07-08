function [data, auxData, metaData, txtData, weights] = mydata_Lissotriton_vulgaris

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Lissotriton_vulgaris'; 
metaData.species_en = 'Smooth newt'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'L_t'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2011 10 04];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 02 09];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 09];

%% set data
% zero-variate data;
data.ab = 25;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 113;     units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'Wiki';
  temp.tj = C2K(12); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 600;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.84;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'BradGrif1995';
data.L240 = 3;     units.L240  = 'cm';label.L240  = 'total length at 240 d';    bibkey.L240= 'wildpro';
  temp.L240 = C2K(15);  units.temp.L240 = 'K'; label.temp.L240 = 'temperature';
data.Lp  = 5.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'wildpro';
data.L970 = 8.5;   units.L970  = 'cm';label.L970  = 'total length at 970 d';    bibkey.L970= 'wildpro';
  temp.L970 = C2K(15); units.temp.L970 = 'K'; label.temp.L970 = 'temperature';

data.Li  = 10.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'wildpro';
data.Wwb = 8.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3'; 
data.Wwp = 0.728;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 5.2*(5.4/10.4)^3';
data.Wwi = 5.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Wiki';

data.Ri  = 350/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
data.tL = [ ... % time since birth (d), total length (cm)
 0  0.841
14	1.537
28	1.771
35	1.891
42	2.060];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'larval total length'};  
temp.tL   = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BradGrif1995'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Metam is assumed to be morphological only, not metabolically; std model is applied';
D2 = 'mod_2: tL data added, weights and Lb revised';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '72KTZ'; % Cat of Life
metaData.links.id_ITIS = '775922'; % ITIS
metaData.links.id_EoL = '333313'; % Ency of Life
metaData.links.id_Wiki = 'Lissotriton_vulgaris'; % Wikipedia
metaData.links.id_ADW = 'Lissotriton_vulgaris'; % ADW
metaData.links.id_Taxo = '985978'; % Taxonomicon
metaData.links.id_WoRMS = '1488289'; % WoRMS
metaData.links.id_amphweb = 'Lissotriton+vulgaris'; % AmphibiaWeb
metaData.links.id_AnAge = 'Lissotriton_vulgaris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lissotriton_vulgaris}}';   
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
bibkey = 'BradGrif1995'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00118596}, ' ...
'author = {L. D. Brady and R. A. Griffiths}, ' ... 
'year = {1995}, ' ...
'title = {Effects of p{H} and aluminium on the growth and feeding behaviour of smooth and palmate newt larvae}, ' ...
'journal = {Turkish Journal of Zoology}, ' ...
'volume = {4(5)}, ' ...
'pages = {299–306}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wildpro'; type = 'Misc'; bib = ...
'howpublished = {\url{http://wildpro.twycrosszoo.org/s/0AmCaudata/salamandridae/triturus/Triturus_vulgaris/Triturus_vulgaris_Summary.htm}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  