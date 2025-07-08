function [data, auxData, metaData, txtData, weights] = mydata_Maurolicus_imperatorius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Sternoptychidae';
metaData.species    = 'Maurolicus_imperatorius'; 
metaData.species_en = 'Emperor seamount lightfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 04 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 22]; 

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SaviBayt2010';  
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 0.85;   units.Lj = 'cm';   label.Lj = 'fork length at postflexion stage';  bibkey.Lj = 'guess';
  comment.Lj = 'based on similar relative length , compared to Maurolicus_muelleri';
data.Lp = 3.4;   units.Lp = 'cm';   label.Lp = 'fork length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on same relative length, compared to Maurolicus_muelleri';
data.Li = 6.8;   units.Li = 'cm';   label.Li = 'ultimate fork length';    bibkey.Li = 'SaviBayt2010';

data.Wwb = 2.68e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Maurolicus_muelleri: 4/3*pi*0.04^3';
data.Wwp = 0.336; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'SaviBayt2010';  
  comment.Wwp = 'based on 7e-6*(10*Lp)^3.057, see F1';  
data.Wwi = 2.8;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'SaviBayt2010';     
  comment.Wwi = 'based on 7e-6*(10*Li)^3.057, see F1';  

data.Ri  = 1.2e4/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 20 cm';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.58 as found for Maurolicus_muelleri';

% uni-variate data
% tL data
data.tL = [ ... % time since birth (month) ~ fork length (cm)
    0 3.1 % april
    1 3.3
    2 3.45
    3 3.8
    4 4.3
    5 4.4
    6 4.7
    7 4.76
    8 4.74
    9 4.83 % jan
   10 4.9
   11 4.9
   12 5.28
   13 5.33
   14 5.39
   15 5.8]; % july
data.tL(:,1) = 30.5 * (6 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SaviBayt2010';
comment.tL = 'reconstructed from length-frequency data; origin guessed';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 7e-6*(FL in mm)^3.057';
metaData.bibkey.F1 = 'SaviBayt2010'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'bathypelagic; depth range 271 - 1524 m, usually 300 - 400 m ';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3YG54'; % Cat of Life
metaData.links.id_ITIS = '622545'; % ITIS
metaData.links.id_EoL = '46563282'; % Ency of Life
metaData.links.id_Wiki = 'Maurolicus_imperatorius'; % Wikipedia
metaData.links.id_ADW = 'Maurolicus_imperatorius'; % ADW
metaData.links.id_Taxo = '179646'; % Taxonomicon
metaData.links.id_WoRMS = '274970'; % WoRMS
metaData.links.id_fishbase = 'Maurolicus-imperatorius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Maurolicus}}';
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
bibkey = 'SaviBayt2010'; type = 'article'; bib = [ ...
'author = {V. F. Savinykh and A. A. Baytalyuk}, ' ... 
'year   = {2010}, ' ...
'title  = {New Data on Biology of the Pearlfish \emph{Maurolicus imperatorius} ({S}ternopthychidae) from the {E}mperor {S}eamount {C}hain}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'page = {148-158}, ' ...
'volume = {50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Maurolicus-imperatorius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

