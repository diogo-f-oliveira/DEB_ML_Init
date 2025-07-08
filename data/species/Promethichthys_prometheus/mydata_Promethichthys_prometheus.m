function [data, auxData, metaData, txtData, weights] = mydata_Promethichthys_prometheus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Gempylidae';
metaData.species    = 'Promethichthys_prometheus'; 
metaData.species_en = 'Roudi escolar'; 
metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(11.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 05];

%% set data
% zero-variate data

data.am = 12*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'RobiReis2009';   
  temp.am = C2K(11.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 51;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'LorePaju1995'; 
data.Li  = 100;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm of Pomatomus saltatrix: pi/6*.1^3';
data.Wwp = 533;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'LorePaju1995';
  comment.Wwp = 'based on 0.004509*Lp^2.9705, see F2';
data.Wwi = 3.94e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','LorePaju1995'};
  comment.Wwi = 'based on 0.004509*Li^2.9705, see F2';

data.Ri  = 3.8e5/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(11.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.7 as found for Pomatomus saltatrix';
 
% uni-variate data

% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
    3 42.8
    4 50.3
    5 56.4
    6 61.6
    7 65.7
    8 69.4
    9 72.3
   10 73.9];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(11.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LorePaju1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Ri = 0 * weights.Ri;

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
F1 = 'Marine; benthopelagic; oceanodromous; depth range 80 - 800 m, subtropical; preferred temperature 11.1 C';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.004509*(TL in cm)^2.9705';
metaData.bibkey.F2 = 'LorePaju1995';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6W9PM'; % Cat of Life
metaData.links.id_ITIS = '172374'; % ITIS
metaData.links.id_EoL = '46577254'; % Ency of Life
metaData.links.id_Wiki = 'Promethichthys_prometheus'; % Wikipedia
metaData.links.id_ADW = 'Promethichthys_prometheus'; % ADW
metaData.links.id_Taxo = '184821'; % Taxonomicon
metaData.links.id_WoRMS = '126866'; % WoRMS
metaData.links.id_fishbase = 'Promethichthys-prometheus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Promethichthys_prometheus}}';
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
bibkey = 'LorePaju1995'; type = 'Article'; bib = [ ... 
'author = {J. M. Lorenzo and J. G. Pajuelo}, ' ... 
'year = {1995}, ' ...
'title = {Biological parameters of the roudi escolar \emph{Promethichthys Prometheus} ({P}isces: {G}empylidae) off the {C}anary {I}slands}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {24}, ' ...
'pages = {65-71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Promethichthys-prometheus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
