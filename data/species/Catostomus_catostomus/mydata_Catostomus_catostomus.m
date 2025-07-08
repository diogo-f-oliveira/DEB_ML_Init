  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_catostomus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_catostomus'; 
metaData.species_en = 'Longnose sucker'; 
metaData.ecoCode.climate = {'Cfb', 'Cfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 05 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 25]; 

%% set data
% zero-variate data
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 38.1;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Bail1969'; 
  comment.Lp = '15 inch';
data.Lpm = 36.8;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Bail1969'; 
  comment.Lpm = '14.5 inch';
data.Li = 64;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'Wiki';

data.Wwb = 4.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Bail1969';
  comment.Wwb = 'Computed from egg diameter of 2.2 mm: pi/6*0.22^3';
data.Wwi = 3.3e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'Wiki';

data.Ri35 = 14e3/365;   units.Ri35 = '#/d';  label.Ri35 = 'Reprod rate at TL = 35.6 cm';    bibkey.Ri35 = 'Bail1969';
  temp.Ri35 = C2K(12); units.temp.Ri35 = 'K'; label.temp.Ri35 = 'temperature';
data.Ri45 = 35e3/365;   units.Ri45 = '#/d';  label.Ri45 = 'Reprod rate at TL = 45.3 cm';    bibkey.Ri45 = 'Bail1969';
  temp.Ri45 = C2K(12); units.temp.Ri45 = 'K'; label.temp.Ri45 = 'temperature';
data.Ri56 = 60e3/365;   units.Ri56 = '#/d';  label.Ri56 = 'Reprod rate at TL = 56.8 cm';    bibkey.Ri56 = 'Bail1969';
  temp.Ri56 = C2K(12); units.temp.Ri56 = 'K'; label.temp.Ri56 = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (inch)
    1  4.0
    2  6.0
    3  7.4
    4  9.0
    5 10.8
    6 13.4
    7 14.5
    8 15.6
    9 16.7
   10 17.2
   11 18.2];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 2.54; % convert inch to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bail1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: log Ww in lb = -1.19426 + 2.8499 * log TL in inch,';
metaData.bibkey.F1 = 'Bail1969'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'RW3W'; % Cat of Life
metaData.links.id_ITIS = '163894'; % ITIS
metaData.links.id_EoL = '211083'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_catostomus'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_catostomus'; % ADW
metaData.links.id_Taxo = '43912'; % Taxonomicon
metaData.links.id_WoRMS = '158706'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-catostomus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_catostomus}}';  
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
bibkey = 'Bail1969'; type = 'Article'; bib = [ ...  
'author = {Merryll M. Bailey}, ' ...
'year = {1969}, ' ...
'title = {Age, Growth, and Maturity of the Longnose Sucker \emph{Catostomus catostomus} of Western {L}ake {S}uperior}, ' ... 
'journal = {J. Fish, Res. Brd Canada}, ' ...
'volume = {26}, '...
'pages = {1289--1299}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-catostomus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
