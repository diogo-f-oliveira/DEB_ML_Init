function [data, auxData, metaData, txtData, weights] = mydata_Notothenia_rossii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Notothenia_rossii'; 
metaData.species_en = 'Marbled rockcod'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MASW','MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2021 03 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 21]; 

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(2.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 58.5; units.Lp  = 'cm';  label.Lp  = 'total length'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on tp = 6-8 yr';
data.Li  = 92; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 2.5e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Burc1983';
  comment.Wwb = 'based 0.00692*Lb^3.13, see F1'; 
data.Wwp = 2.35e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'Burc1983';
  comment.Wwp = 'based on 0.00692*Lp^3.13, see F1';
data.Wwi = 9.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Burc1983';
  comment.Wwi = 'based on 0.00692*Li^3.13, see F1';

data.Ri = 37e3/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(2.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.6';
  
% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), total length (cm)
    0  7
    1 12
    2 24
    3 29
    4 34
    5 45
    6 52
    7 58.5
    8 61.5
    9 64.5
   10 67.5
   11 70
   12 72
   13 72];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(2.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Burc1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 2 * weights.psd.kap;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W = 0.00692*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; demersal; preferred 2.1 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '47YZT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46572977'; % Ency of Life
metaData.links.id_Wiki = 'Notothenia_rossii'; % Wikipedia
metaData.links.id_ADW = 'Notothenia_rossii'; % ADW
metaData.links.id_Taxo = '181463'; % Taxonomicon
metaData.links.id_WoRMS = '234840'; % WoRMS
metaData.links.id_fishbase = 'Notothenia-rossii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notothenia_rossii}}';
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
bibkey = 'Burc1983'; type = 'Article'; bib = [ ... 
'author = {M. S. Burchett}, ' ... 
'year = {1983}, ' ...
'title = {Age and growth of the {A}ntarctic fish \emph{Notothenia rossi} from {S}outh {G}eorgia}, ' ...
'journal = {Br. Antarct. Surv. Bull.}, ' ...
'volume = {60}, ' ...
'pages = {45-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Notothenia-rossii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
