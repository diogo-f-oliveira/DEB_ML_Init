  function [data, auxData, metaData, txtData, weights] = mydata_Xiphophorus_maculatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Xiphophorus_maculatus'; 
metaData.species_en = 'Southern platyfish'; 

metaData.ecoCode.climate = {'Am','Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 01];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc    = [2020 10 01]; 

%% set data
% zero-variate data
data.ab = 24;        units.ab = 'd';  label.ab = 'gestation time';         bibkey.ab = 'fishbase';
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;        units.am = 'd';  label.am = 'maximum life span';   bibkey.am = 'aquawiki';
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.83;  units.Lb = 'cm';  label.Lb = 'total length at birth';     bibkey.Lb = 'MoshEagd2015';
  comment.Lb = 'value for Xiphophorus helleri';
data.Lp = 3.2;  units.Lp = 'cm';  label.Lp = 'total length at puberty';    bibkey.Lp = 'Feli1951';
data.Li = 6;  units.Li = 'cm';  label.Li = 'ultimate total length';        bibkey.Li = 'fishbase';
data.Lim = 4;  units.Lim = 'cm';  label.Lim = 'ultimate total length for males';  bibkey.Lim = 'fishbase';

data.Wwb = 1.35e-2;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = {'MoshEagd2015','fishbase'};   
  comment.Wwb = 'based on 0.02360*Lb^3, see F1';
data.Wwp = 0.77; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'Feli1951','fishbase'};
  comment.Wwp = 'based on 0.02360*Lp^3, see F1';
data.Wwi = 5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02360*Li^3, see F1';
data.Wwim = 1.51; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = {'guess','fishbase'};
   comment.Wwi = 'based on 0.02360*Lim^3, see F1';

data.Ri = 80/30;       units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '80 pups per litter, litter interval is assumed to equalbe 30 d';
    
% univariate data
% time-length
data.tL = [ ... % time (d), total length (cm)
30.904	1.843
61.250	2.678
122.089	3.166
153.478	3.246
182.076	3.317
214.858	3.396
244.152	3.467
273.455	3.556
333.499	3.831
366.252	3.849
396.239	3.911
426.242	4.009
457.623	4.071
487.606	4.124
517.609	4.222
549.674	4.257
579.640	4.275];
units.tL = {'d','cm'};  label.tL = {'time since birth','total length'};     
temp.tL = C2K(22.1); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Feli1951';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length - weight: Ww in g = 0.02360 * (TL in cm)^3'; 
  metaData.bibkey.F1 = 'fishbase';
F2 = 'viviparous';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5CFPH'; % Cat of Life
metaData.links.id_ITIS = '165970'; % ITIS
metaData.links.id_EoL = '205185'; % Ency of Life
metaData.links.id_Wiki = 'Xiphophorus_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Xiphophorus_maculatus'; % ADW
metaData.links.id_Taxo = '44595'; % Taxonomicon
metaData.links.id_WoRMS = '862549'; % WoRMS
metaData.links.id_fishbase = 'Xiphophorus-maculatus'; % fishbase


%% References

bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Xiphophorus-maculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Xiphophorus_maculatus}}';
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
bibkey = 'Feli1951'; type = 'Article'; bib = [ ...
'author = {Frances E. Felin}, ' ...
'year = {1951}, ' ...
'title = {Growth Characteristics of the Poeciliid Fish \emph{Platypoecilus maculatus}}, ' ... 
'journal = {Copeia}, ' ...
'pages = {15-28}, ', ...
'volume = {1951(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoshEagd2015'; type = 'Article'; bib = [ ...
'author = {Fatemeh Moshayedi and Soheil Eagderi and Firooze Parsazade and Hoda Azimi and Hamed Mousavi-Sabet}, ' ...
'year = {2015}, ' ...
'title = {Allometric growth pattern of the swordtail - \emph{Xiphophorus helleri} ({C}yprinodontiformes, {P}oeciliidae) during early development}, ' ... 
'journal = {Poeciliid Research}, ' ...
'pages = {18-23}, ', ...
'volume = {5(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aquawiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://theaquariumwiki.com/wiki/Xiphophorus_maculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

