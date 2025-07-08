function [data, auxData, metaData, txtData, weights] = mydata_Ammodytes_americanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Ammodytidae';
metaData.species    = 'Ammodytes_americanus'; 
metaData.species_en = 'American sand lance'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 20];

%% set data
% zero-variate data

data.ab = 32;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(7.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(7.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 23;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.9 mm of Ammodytes_marinus: pi/6*0.09^3'; 
data.Wwp = 2.1; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00204*Lp^3.16, see F1';
data.Wwi = 41; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00204*Li^3.16, see F1';

data.Ri  = 58.6e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'WestAber1979';   
  temp.Ri = C2K(7.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on yearly fecundity: 10^(3.857*log10(23)-0.484)';

% uni-variate data
% time-length
data.tL = [  ... % time since birth (mnth), total length (cm)
    3  8.69
    6 10.34
   15 10.87
   18 12.30
   27 12.28
   30 14.68
   39 14.83 
   42 15.65
   63 15.86
   66 16.25
   75 16.39];
data.tL(:,1) = 30.5 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(7.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BretSain1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from CEG, N coast'};
% set2 = {'tW','tW1'}; subtitle2 = {'Data from CEG, N coast'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperature (C) in tL data is assumed to vary as T(t) = 11+10*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00204*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66BLK'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Ammodytes_americanus'; % Wikipedia
metaData.links.id_ADW = 'Ammodytes_americanus'; % ADW
metaData.links.id_Taxo = '46520'; % Taxonomicon
metaData.links.id_WoRMS = '159587'; % WoRMS
metaData.links.id_fishbase = 'Ammodytes-americanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ammodytes_americanus}}';
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
bibkey = 'BretSain1992'; type = 'Article'; bib = [ ... 
'author = {Brethes, J-C.F. and R. Saint-Pierre and G. Desrosiers}, ' ... 
'year = {1992}, ' ...
'title = {Growth and sexual maturation of the {A}merican sand lance (\emph{Ammodytes americanus} {D}ekay) off the north shore of the {G}ulf of {S}t. {L}awrence}, ' ...
'journal = {J. Northw. Atl. Fish. Sci.}, ' ...
'volume = {12}, ' ...
'pages = {41-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WestAber1979'; type = 'Article'; bib = [ ... 
'author = {Westin, D.T. and K.J. Abernethy and L.E. Meller and B.A. Rogers}, ' ... 
'year = {1979}, ' ...
'title = {Some aspects of biology of the {A}merican sand lance, \emph{Ammodytes americanus}}, ' ...
'journal = {Trans. Am. Fish. Soc.}, ' ...
'volume = {108(3)}, ' ...
'pages = {328-331}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ammodytes-americanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

