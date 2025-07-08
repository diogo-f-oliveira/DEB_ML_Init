function [data, auxData, metaData, txtData, weights] = mydata_Pagellus_bogaraveo

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagellus_bogaraveo'; 
metaData.species_en = 'Blackspot seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.2); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L', 'L-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 13];

%% set data
% zero-variate data;

data.ab = 11.5;      units.ab = 'd';      label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(11.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';      
data.am = 15*365;       units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(11.2);  units.temp.am = 'K'; label.temp.am = 'temperature';      
  
data.Lp  = 31.4;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';   bibkey.Lp  = 'fishbase';
data.Li  = 70;   units.Li  = 'cm';   label.Li  = 'ultimate total lenght';     bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-5; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.55 mm of Pagellus acarne; pi/6*0.055^3'; 
data.Wwi = 4.27e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.03, see F1';

data.Ri  = 1.125e6/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(11.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 11.5 11.4
    2 17.7 17.6
    3 22.5 22.2
    4 26.4 26.1
    5 29.7 29.4
    6 32.4 32.2
    7 34.7 34.5
    8 36.5 36.3
    9 38.2 37.9
   10 39.6 39.3
   11 40.9 40.5
   12 42.0 41.8
   13 43.4 43.1
   14 44.1 43.6
   15 44.7 44.3
   16 45.6 45.0
   17 48.0 46.0];
data.tL(:,1) = (data.tL(:,1) + 0.66)*365; % convert year class to time since birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};     
  temp.tL = C2K(11.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  bibkey.tL = 'Gueg1969'; treat.tL = {1 {'females','males'}};
  
data.LW = [ ... % log10 total length(cm), log10 weight (g)
1.111	1.465
1.148	1.511
1.179	1.578
1.202	1.659
1.275	1.965
1.297	2.000
1.321	2.049
1.357	2.205
1.397	2.376
1.449	2.441
1.460	2.530
1.479	2.519
1.493	2.586
1.508	2.635
1.519	2.665
1.532	2.711
1.547	2.754
1.556	2.797
1.569	2.838
1.578	2.865
1.591	2.903
1.596	2.941
1.614	2.968
1.625	3.008
1.632	3.019
1.643	3.076
1.653	3.105
1.666	3.143
1.676	3.151
1.682	3.176
1.691	3.232
1.695	3.289];
data.LW = 10.^(data.LW); % remove log transform
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Gueg1969';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6TKP8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579965'; % Ency of Life
metaData.links.id_Wiki = 'Pagellus_bogaraveo'; % Wikipedia
metaData.links.id_ADW = 'Pagellus_bogaraveo'; % ADW
metaData.links.id_Taxo = '182487'; % Taxonomicon
metaData.links.id_WoRMS = '127059'; % WoRMS
metaData.links.id_fishbase = 'Pagellus-bogaraveo'; % fishbase

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagellus_bogaraveo}}';
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
bibkey = 'Gueg1969'; type = 'Article'; bib = [ ... 
'author = {Jacques Gueguen}, ' ...
'year = {1969}, ' ...
'title = {CROISSANCE DE LA DORADE, \emph{{P}agellusb ogaraveo} {D}ELAROCHE}, ' ...
'journal = {Rev. Trav. lnst. P\^{e}ches marit.}, ' ...
'volume = {33(3)}, ' ...
'pages = {251-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Pagellus-bogaraveo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

