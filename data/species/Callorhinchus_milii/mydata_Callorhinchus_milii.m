function [data, auxData, metaData, txtData, weights] = mydata_Callorhinchus_milii

%% set  metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Chimaeriformes'; 
metaData.family     = 'Callorhinchidae';
metaData.species    = 'Callorhinchus_milii'; 
metaData.species_en = 'Australian ghostshark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.2);% K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2020 10 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 20]; 


%% set data
% zero-variate data
data.ab = 8*30.5; units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'fishbase';    
  temp.ab = C2K(15.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;  units.am = 'd';  label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(15.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 15;   units.Lb = 'cm'; label.Lb = 'total length at birth'; bibkey.Lb = 'fishbase';
data.Lp = 71;    units.Lp = 'cm'; label.Lp = 'total length at puberty';   bibkey.Lp = 'fishbase';
data.Lpm = 50;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';   bibkey.Lpm = 'Sull1977';
data.Li = 119.8;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'Fran1997';
  comment.Li = 'based on FL 97 cm, and F2';
data.Lim = 93.8;    units.Lim = 'cm'; label.Lim = 'ultimate total length';       bibkey.Lim = 'Fran1997';
  comment.Lim = 'based on FL 76 cm, and F2';

data.Wwi = 14.5e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00417* Li^3.12, see F1';

data.Ri = 2/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% uni-variate data

%  time length
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	13.433
0.995	28.209
1.996	35.261
2.996	45.336
4.002	61.455
4.999	82.780
5.992	88.657];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'}; 
temp.tL = C2K(15.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Sull1977'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00417 * (TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'PVZD'; % Cat of Life
metaData.links.id_ITIS = '564644'; % ITIS
metaData.links.id_EoL = '46561159'; % Ency of Life
metaData.links.id_Wiki = 'Callorhinchus_milii'; % Wikipedia
metaData.links.id_ADW = 'Callorhinchus_milii'; % ADW
metaData.links.id_Taxo = '165218'; % Taxonomicon
metaData.links.id_WoRMS = '278469'; % WoRMS
metaData.links.id_fishbase = 'Callorhinchus-milii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Callorhinchus_milii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Misc'; bib = [ ... % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year   = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'page = {300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sull1977'; type = 'Article'; bib = [...
'doi = {10.1080/00288330.1977.9515710}, ' ... 
'author = {K. J. Sullivan}, ' ... 
'year   = {1977}, ' ...
'title  = {Age and growth of the elephant fish \emph{Callorhinchus milii} ({E}lasmobranchii: {C}allorhynchidae)}, ' ...
'journal = {N. Z. Journal of Marine and Freshwater Research}, '...
'page = {745-753}, ' ...
'volume = {11(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fran1997'; type = 'Article'; bib = [...
'doi = {10.1080/00288330.1997.9516741}, ' ... 
'author = {Malcolm P. Francis}, ' ... 
'year   = {1997}, ' ...
'title  = {Spatial and temporal variation in the growth rate of elephantfish (\emph{Callorhinchus milii})}, ' ...
'journal = {N. Z. Journal of Marine and Freshwater Research}, '...
'page = {9-23}, ' ...
'volume = {31(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Callorhinchus-milii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


