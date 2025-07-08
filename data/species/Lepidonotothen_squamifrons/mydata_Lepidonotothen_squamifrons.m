  function [data, auxData, metaData, txtData, weights] = mydata_Lepidonotothen_squamifrons
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Lepidonotothen_squamifrons'; 
metaData.species_en = 'Grey rockcod'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 29];

%% set data
% zero-variate data
data.ab = 60;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'fishbase';   
  temp.ab = C2K(-0.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 19*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'DuhaOzou1985';   
  temp.am = C2K(1.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 37.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase'; 
data.Li = 55;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0014;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DuhaOzou1985';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 589;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00468*Lp^3.24, see F1';
data.Wwi = 2.04e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.24, see F1';

data.Ri = 180000/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(1.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time(yr), total length (cm)
    5 23.0
    6 25.0
    7 28.6
    8 31.8
    9 33.6
   10 36.0
   11 38.5
   12 40.6
   13 43.0
   14 44.3
   15 46.4
   16 48.3
   17 48.8
   18 51.0
   19 52.0];
data.tL(:,1) = 365 * (0+data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(1.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DuhaOzou1985'; 
comment.tL = 'Data from Kerguelen {I}slands';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00468*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TC9R'; % Cat of Life
metaData.links.id_ITIS = '642886'; % ITIS
metaData.links.id_EoL = '65472171'; % Ency of Life
metaData.links.id_Wiki = 'Lepidonotothen_squamifrons'; % Wikipedia
metaData.links.id_ADW = 'Lepidonotothen_squamifrons'; % ADW
metaData.links.id_Taxo = '178385'; % Taxonomicon
metaData.links.id_WoRMS = '234788'; % WoRMS
metaData.links.id_fishbase = 'Lepidonotothen-squamifrons'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lepidonotothen_squamifrons}}';  
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
bibkey = 'DuhaOzou1985'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00263877}, ' ...
'author = {G. Duhamel and C. Ozouf-Costaz}, ' ...
'year = {1985}, ' ...
'title = {Age, growth and reproductive biology of \emph{Notothenia squamifrons} {G}unther, 1880 from the {I}ndian sector of the {S}outhern {O}cean}, ' ... 
'journal = {Polar Biol.}, ' ...
'volume = {4(3)}, ' ...
'pages = {143–153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepidonotothen-squamifrons.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
