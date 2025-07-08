function [data, auxData, metaData, txtData, weights] = mydata_Evynnis_cardinalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Evynnis_cardinalis'; 
metaData.species_en = 'Threadfin porgy'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-dL';'t-dWw'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 09];

%% set data
% zero-variate data

data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(25.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 17*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(25.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Dentex dentex';

data.Lp  = 11.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 40;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 31.2;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.01950*Lp^3.00, see F1';
data.Wwi = 1248;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01950*Li^3.00, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(25.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-change in length-change in weight
data.tdLdW_1962 = [ ... % time since birth (yr), change in length (cm/yr), change in weight (g/yr)
    0.0 8.137  NaN
    0.5 6.819  4.159
    1.0 5.837  6.969
    1.5 4.856  9.066
    2.0 4.062 10.300
    2.5 3.381 10.897
    3.0 2.887 10.856
    3.5 2.393 10.403
    4.0 1.975  9.688
    4.5 1.706  8.934
    5.0 1.399  7.994];
data.tdLdW_1962(:,1) = (0.1+data.tdLdW_1962(:,1))* 365; % convert yr to d
data.tdLdW_1962(:,2:3) = data.tdLdW_1962(:,2:3)/ 365; % convert yr to d
units.tdLdW_1962   = {'d', 'cm/d', 'g/d'};  label.tdLdW_1962 = {'time since birth','change in length','change in weight'};  
temp.tdLdW_1962    = C2K(25.2);  units.temp.tdLdW_1962 = 'K'; label.temp.tdLdW_1962 = 'temperature';
bibkey.tdLdW_1962 = 'ZhanChen2016'; treat.tdLdW_1962 = {1 {'change in length','change in weight'}}; 
label.treat.tdLdW_1962 = '1962';
%
data.tdLdW_2006 = [ ... % time since birth (yr), change in length (cm/yr), change in weight (g/yr)
    0.0 9.600 NaN
    0.5 7.456 4.234
    1.0 5.837 6.781
    1.5 4.631 7.941
    2.0 3.537 8.238
    2.5 2.781 7.672
    3.0 2.250 6.919
    3.5 1.606 5.941
    4.0 1.262 4.963
    4.5 0.993 4.059
    5.0 0.724 3.306];
data.tdLdW_2006(:,1) = (0.1+data.tdLdW_2006(:,1))* 365; % convert yr to d
data.tdLdW_2006(:,2:3) = data.tdLdW_2006(:,2:3)/ 365; % convert yr to d
units.tdLdW_2006   = {'d', 'cm/d', 'g/d'};  label.tdLdW_2006 = {'time since birth','change in length','change in weight'};  
temp.tdLdW_2006    = C2K(25.2);  units.temp.tdLdW_2006 = 'K'; label.temp.tdLdW_2006 = 'temperature';
bibkey.tdLdW_2006 = 'ZhanChen2016'; treat.tdLdW_2006 = {1 {'change in length','change in weight'}}; 
label.treat.tdLdW_2006 = '2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tdLdW_1962 = 5 * weights.tdLdW_1962;
weights.tdLdW_2006 = 5 * weights.tdLdW_2006;
weights.ab = 0 * weights.ab;

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
F1 = 'weight-length relationship: Ww in g = 0.01950*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3DJ96'; % Cat of Life
metaData.links.id_ITIS = '647944'; % ITIS
metaData.links.id_EoL = '46580082'; % Ency of Life
metaData.links.id_Wiki = 'Evynnis_cardinalis'; % Wikipedia
metaData.links.id_ADW = 'Evynnis_cardinalis'; % ADW
metaData.links.id_Taxo = '174430'; % Taxonomicon
metaData.links.id_WoRMS = '280766'; % WoRMS
metaData.links.id_fishbase = 'Evynnis-cardinalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Evynnis_cardinalis}}';
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
bibkey = 'ZhanChen2016'; type = 'Article'; bib = [ ... 
'doi = {10.3969/j.issn.2095-0780.2016.06.002}, ' ...
'author = {Zhang, Kui and Chen, Zuozhi and Qiu Yongsong}, ' ... 
'year = {2016}, ' ...
'title = {Decadal changes in growth, mortality and maturity parameters of \emph{Evynnis cardinalis} in {B}eibu {G}ulf}, ' ...
'journal = {South China Fisheries Science}, ' ...
'volume = {12(6)}, ' ...
'pages = {9-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Evynnis-cardinalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
