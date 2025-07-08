function [data, auxData, metaData, txtData, weights] = mydata_Rexea_solandri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Gempylidae';
metaData.species    = 'Rexea_solandri'; 
metaData.species_en = 'Silver gemfish';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 06];

%% set data
% zero-variate data

data.am = 16*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(10.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 65;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 110;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm of Pomatomus saltatrix: pi/6*.1^3';
data.Wwp = 1710;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00347*Lp^3.14, see F1';
data.Wwi = 8919;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00347*Li^3.14, see F1';

data.Ri  = 4e6/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(10.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  21.3
    2  39.3
    3  50.4
    4  60.1
    5  66.1
    6  73.6
    7  78.8
    8  82.2
    9  86.8
   10  88.0
   11  94.0
   12  99.3
   13 104.0];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(10.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WithWank1989';

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

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00347*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RV5B'; % Cat of Life
metaData.links.id_ITIS = '550883'; % ITIS
metaData.links.id_EoL = '46577268'; % Ency of Life
metaData.links.id_Wiki = 'Rexea_solandri'; % Wikipedia
metaData.links.id_ADW = 'Rexea_solandri'; % ADW
metaData.links.id_Taxo = '185854'; % Taxonomicon
metaData.links.id_WoRMS = '276890'; % WoRMS
metaData.links.id_fishbase = 'Rexea-solandri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rexea_solandri}}';
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
bibkey = 'WithWank1989'; type = 'Article'; bib = [ ... 
'doi = {10.1071/mf9890215}, ' ...
'author = {Withell, Anne F. and Wankowski, Jacek W. J.}, ' ... 
'year = {1989}, ' ...
'title = {Age, growth estimates for pink ling, \emph{Genypterus blacodes} ({S}chneider), and gemfish, \emph{Rexea solandri} ({C}uvier), from {E}astern {B}ass {S}trait, {A}ustralia}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {40(2)}, ' ...
'pages = {215-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Rexea-solandri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
