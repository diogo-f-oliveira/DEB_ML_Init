function [data, auxData, metaData, txtData, weights] = mydata_Zosterisessor_ophiocephalus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Zosterisessor_ophiocephalus'; 
metaData.species_en = 'Grass goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0pMcp','piMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.1); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 14];

%% set data
% zero-variate data

data.ab = 7;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(17.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6.5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'HajjOuan2013';   
  temp.am = C2K(17.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.65;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'HajjOuan2013'; 
data.Lpm = 13.91;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';    bibkey.Lpm  = 'HajjOuan2013'; 
data.Li  = 29.9;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 0.5 mm: pi/6*0.05^3';
data.Wwp = 20.76;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','HajjOuan2013'};
  comment.Wwp = 'based on 0.01000*Lp^3.01, see F1';
data.Wwi = 276.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.01, see F1';

data.Ri = 45e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [... %  yr class (yr), total length (cm)
    1  5.53  5.81
    2  8.88  9.10
    3 11.49 11.60
    4 13.95 14.08
    5 15.89 16.09
    6 17.15 17.29]; 
data.tL_fm(:,1) = 365 * (.5 + data.tL_fm(:,1)); 
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(17.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'HajjOuan2013'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5D8KN'; % Cat of Life
metaData.links.id_ITIS = '172086'; % ITIS
metaData.links.id_EoL = '46575326'; % Ency of Life
metaData.links.id_Wiki = 'Zosterisessor_ophiocephalus'; % Wikipedia
metaData.links.id_ADW = 'Zosterisessor_ophiocephalus'; % ADW
metaData.links.id_Taxo = '154139'; % Taxonomicon
metaData.links.id_WoRMS = '126942'; % WoRMS
metaData.links.id_fishbase = 'Zosterisessor-ophiocephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zosterisessor_ophiocephalus}}';
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
bibkey = 'HajjOuan2013'; type = 'Article'; bib = [ ... 
'author = {Ferid Hajji and Amira Ouannes-Ghorbel and Mohamed Ghorbel and Othman Jarboui}, ' ... 
'year = {2013}, ' ...
'title = {Age and Growth of the Grass goby \emph{Zosterisessor ophiocephalus} {P}allas, 1811 in the {G}ulf of {G}abes ({T}unisia, Central {M}editerranean)}, ' ...
'journal = {Acta Adriat.}, ' ...
'volume = {54(1)}, ' ...
'pages = {27-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Zosterisessor-ophiocephalus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

