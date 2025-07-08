  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_fallax

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_fallax'; 
metaData.species_en = 'Twaite shad'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm','MAbl','THp'};
metaData.ecoCode.habitat = {'jiMpe', 'piFr', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 22];

%% set data
data.am = 25*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 32.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0042; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'EsteAndr2008';
  comment.Wwb = 'based on egg diameter of 1.7-2.4 mm: pi/6*0.2^3';
data.Wwp = 229.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00603*Lp^3.03, see F1';
data.Wwi = 1.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.03, see F1';
  
data.Ri = 2e5/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(10.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % year class (yr), total length (cm)
    1  8.86  8.55
    2 18.91 18.19
    3 27.98 27.07
    4 34.80 32.51
    5 38.59 34.98
    6 40.62 36.58
    7 41.94 38.64
    8 43.40 40.07
    9 44.66 40.76
   10 46.07 40.80
   11 47.97 NaN];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(10.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature'; 
bibkey.tL_fm = {'ApraBagl2003'}; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 50;
weights.Ri = weights.Ri * 5;
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00603*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'C5M6'; % Cat of Life
metaData.links.id_ITIS = '161716'; % ITIS
metaData.links.id_EoL = '46562370'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_fallax'; % Wikipedia
metaData.links.id_ADW = 'Alosa_fallax'; % ADW
metaData.links.id_Taxo = '42628'; % Taxonomicon
metaData.links.id_WoRMS = '126415'; % WoRMS
metaData.links.id_fishbase = 'Alosa-fallax'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_fallax}}';  
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
bibkey = 'ApraBagl2003'; type = 'article'; bib = [ ... 
'author = {Miran W. Aprahamian and Jean-Luc Baglini\`{e}re and M. Richard Sabati\''{e} and Paulo Alexandrino and Ralf Thiel}, '...
'year = {2003}, ' ...
'title = {Biology, Status, and Conservation of the Anadromous {A}tlantic Twaite Shad \emph{Alosa fallax fallax}}, ' ...
'journal = {American Fisheries Society Symposium}, ' ...
'volume = {35}, ' ...
'pages = {103–124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Apra1988'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1988.tb05568.x}, ' ...
'author = {Aprahamian, M. W.}, '...
'year = {1988}, ' ...
'title = {The biology of the twaite shad, \emph{Alosa fallax fallax} ({L}acepede), in the {S}evern {E}stuary}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {33(sa)}, ' ...
'pages = {141–152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EsteAndr2008'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.actao.2008.05.008}, ' ...
'author = {Esteves, E. and Pedro Andrade, J.}, '...
'year = {2008}, ' ...
'title = {Diel and seasonal distribution patterns of eggs, embryos and larvae of Twaite shad \emph{Alosa fallax fallax} ({L}ac\''{e}p\`{e}de, 1803) in a lowland tidal river}, ' ...
'journal = {Acta Oecologica}, ' ...
'volume = {34(2)}, ' ...
'pages = {172–185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Alosa-fallax.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  