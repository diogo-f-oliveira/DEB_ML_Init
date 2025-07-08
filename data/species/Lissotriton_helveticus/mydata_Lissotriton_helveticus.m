function [data, auxData, metaData, txtData, weights] = mydata_Lissotriton_helveticus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Lissotriton_helveticus'; 
metaData.species_en = 'Palmate newt'; 

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
metaData.data_1     = {}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2011 10 04];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 08];

%% set data
% zero-variate data;
data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '8-21 d';
data.tj = 2.5*30.5;     units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'Wiki';
  temp.tj = C2K(12); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '1.5-3.5 mnth';
data.tp = 2.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.9;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'BradGrif1995';
data.Lp  = 5.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess';
  comment.Lp = 'based on Lissotriton vulgaris';
data.Li  = 9.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length of females';      bibkey.Li  = 'Wiki';
data.Lim  = 8.5;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length of males';      bibkey.Lim  = 'Wiki';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 1.3-1.8 mm: pi/6*0.15^3'; 
data.Wwp = 0.96;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'estimated from 5.2 * (5.4/9.5)^3';
data.Wwi = 5.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'guess';

data.Ri  = 300/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '150-440 eggs per season';
 
% univariate data
% time-length
data.tL = [ ... time since birth (d), larval total length (cm)
 0.191	0.971
14.076	1.453
28.120	1.712
35.226	1.813
42.250	1.980];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'larval total length'};  
temp.tL   = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BradGrif1995'; 


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 10 * weights.Lb;
weights.Lp = 0 * weights.Lp;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'Metam is assumed to be morphological only, not metabolically; std model is applied';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3VGGY'; % Cat of Life
metaData.links.id_ITIS = '775919'; % ITIS
metaData.links.id_EoL = '332574'; % Ency of Life
metaData.links.id_Wiki = 'Lissotriton_helveticus'; % Wikipedia
metaData.links.id_ADW = 'Lissotriton_helveticus'; % ADW
metaData.links.id_Taxo = '985975'; % Taxonomicon
metaData.links.id_WoRMS = '1507483'; % WoRMS
metaData.links.id_amphweb = 'Lissotriton+helveticus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lissotriton_helveticus}}';   
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
