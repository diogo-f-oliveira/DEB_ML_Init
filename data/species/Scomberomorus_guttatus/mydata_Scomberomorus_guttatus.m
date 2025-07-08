function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_guttatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_guttatus'; 
metaData.species_en = 'Indo-Pacific king mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN', 'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 30];

%% set data
% zero-variate data

data.am = 15*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Scomberomorus_commerson';

data.Lp  = 39.8;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 76;     units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Scomberomorus_commerson: pi/6*0.05^3';
data.Wwp = 526.6;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00776*Lp^3.02, see F1';
data.Wwi = 3.71e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.02, see F1';

data.Ri  = 1100000 	/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(28.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of 640800';

% uni-variate data
% time-length
data.tL = [ ... % time since brth (yr), total length (cm)
    1 31.5
    2 65.0
    3 72.5
    4 85.9];
data.tL(:,1) = (data.tL(:,1)+ 0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'DevaKuru1997';

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTX8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46577316'; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_guttatus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '187068'; % Taxonomicon
metaData.links.id_WoRMS = '219716'; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-lineolatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_guttatus}}';
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
bibkey = 'DevaKuru1997'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://core.ac.uk/download/pdf/33017552.pdf}}, ' ...
'author = {Devaraj, M. and K.N. Kurup and N.G.K. Pillai and K. Bala and E. Vivekanandan and R. Sathiadhas}, ' ...
'year = {1997}, ' ...
'title = {Status, prospects and management of small pelagic fisheries in {I}ndia}, ' ... 
'journal = {RAP Publication: Bangkok, Thailand}, ' ...
'volume = {31}, '...
'pages = {191-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scomberomorus-guttatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
