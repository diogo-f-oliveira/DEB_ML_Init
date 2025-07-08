  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_columbianus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_columbianus'; 
metaData.species_en = 'Bridgelip sucker'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 30]; 

%% set data
% zero-variate data
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'Daub1980'; 
  comment.Lp = 'based on FL 33.4 cm';
data.Li = 45;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'Daub1980';
  comment.Li = 'fishbase gives TL 30 cm';

data.Wwb = 8.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Daub1980';
  comment.Wwb = 'based on egg diameter of 2.1 - 3  mm: pi/6*0.25^3';
data.Wwp = 516; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','Daub1980'};
  comment.Wwp = 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 1.06e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

data.Ri = 21040/365; units.Ri = '#/d'; label.Ri = 'reprod rate at FL 45.9 cm, TL 48.8 cm';  bibkey.Ri = 'Daub1980';
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


% univariate data

% time-length
data.tL = [ ... % year class (yr), fork length (cm)
    1  6.3
    2 14.8
    3 22.4
    4 29.1
    5 33.5
    6 36.1
    7 38.7
    8 40.1
    9 40.8];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/0.94; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Daub1980';

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
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000 * (TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.94 cm';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'RW3Z'; % Cat of Life
metaData.links.id_ITIS = '163897'; % ITIS
metaData.links.id_EoL = '994729'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_columbianus'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_columbianus'; % ADW
metaData.links.id_Taxo = '166641'; % Taxonomicon
metaData.links.id_WoRMS = '592847'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-columbianus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_columbianus}}';  
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
bibkey = 'Daub1980'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(1980)109<92:LHOTBS>2.0.CO;2}, ' ...
'author = {Dennis D. Dauble}, ' ...
'year = {1980}, ' ...
'title = {Life History of the Bridgelip Sucker in the {C}entral {C}olumbia {R}iver}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {109(1)}, ' ...
'pages = {92-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-columbianus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

