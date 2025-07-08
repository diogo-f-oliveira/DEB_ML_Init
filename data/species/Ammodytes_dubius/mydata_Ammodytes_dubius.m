function [data, auxData, metaData, txtData, weights] = mydata_Ammodytes_dubius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Ammodytidae';
metaData.species    = 'Ammodytes_dubius'; 
metaData.species_en = 'Northern sand lance'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN','MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

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
  temp.ab = C2K(7.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'NelsRoss1992';   
  temp.am = C2K(7.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'NelsRoss1992'; 
data.Li  = 25;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.9 mm of Ammodytes_marinus: pi/6*0.09^3'; 
data.Wwp = 3.1; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'NelsRoss1992','fishbase'};
  comment.Wwp = 'based on 0.00204*Lp^3.06, see F1';
data.Wwi = 38.7; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00204*Li^3.06, see F1';

% uni-variate data
% time-length
data.tL = [  ... % time since birth (d), total length (cm)
   0	 0.457
  60	 1.018
 120	 2.790
 153	 5.696
 183	 6.776
 213	 8.404
 306	10.548
 730	13.293
1095	16.140
1460	18.355];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(7.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NelsRoss1992'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    12  2094
    13  2848
    14  3787
    15  4938 
    16  6239
    17  7991
    18  9956
    19 12258
    20 14932
    21 18015
    22 21547];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(7.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'NelsRoss1992'; 

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
D2 = 'Temperature (C) in tL data is assumed to vary as T(t) = 10+10*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00204*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CTLF'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46573105'; % Ency of Life
metaData.links.id_Wiki = 'Ammodytes'; % Wikipedia
metaData.links.id_ADW = 'Ammodytes_dubius'; % ADW
metaData.links.id_Taxo = '160647'; % Taxonomicon
metaData.links.id_WoRMS = '151520'; % WoRMS
metaData.links.id_fishbase = 'Ammodytes-dubius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ammodytes}}';
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
bibkey = 'NelsRoss1992'; type = 'Article'; bib = [ ... 
'author = {Gary A. Nelson and Michael R. Ross}, ' ... 
'year = {1992}, ' ...
'title = { Biology and Population Changes of Northern Sand Lance (\emph{Ammodytes dubius}) from the {G}ulf of {M}aine to the {M}iddle {A}tlantic {B}ight}, ' ...
'journal = {J Northw. Atl. Fish Sci.}, ' ...
'volume = {11}, ' ...
'pages = {11-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ammodytes-dubius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

