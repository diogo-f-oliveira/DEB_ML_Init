  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_clupeaformis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_clupeaformis'; 
metaData.species_en = 'Lake whitefish'; 

metaData.ecoCode.climate = {'MC', 'ME', 'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'MAN','THn'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 15]; 

%% set data
% zero-variate data
data.am = 50*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 46.7;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'ADW'; 
  comment.Lp = '28 to 34 cm';
data.Li = 100;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.5 mm for Coregonus_albula: pi/6*0.15^3';
data.Wwp = 1.27e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'ADW','fishbase'};
  comment.Wwp = 'based on 0.00537*Lp^3.22, see F1';
data.Wwi = 14.79e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00537*Li^3.22, see F1';
    
data.Ri = 121700/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time (d), total length (cm)
 1 12.0
 2 14.5
 3 17.5
 4 18.7
 5 20.0
 6 21.0
 7 22.0
 8 23.3
 9 23.3
10 23.5
11 23.8
12 24.7
13 25.0
14 25.2
16 26.6];
data.tL(:,1) = 365 * (1.75 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OostHile1949';
comment.tL = 'Data from Lake Erie';

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


%% Discussion points
D1 = 'Temperature is guessed at the preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00537*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'YD8V'; % Cat of Life
metaData.links.id_ITIS = '161941'; % ITIS
metaData.links.id_EoL = '46563172'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_clupeaformis'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_clupeaformis'; % ADW
metaData.links.id_Taxo = '42844'; % Taxonomicon
metaData.links.id_WoRMS = '158726'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-clupeaformis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_clupeaformis}}';  
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
bibkey = 'OostHile1949'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1947)77[178:AAGOTL]2.0.CO;2}, ' ...
'author = {John Van Oosten and Ralph Hile}, ' ...
'year = {1949}, ' ...
'title = {Age and Growth of the Lake Whitefish, \emph{Coregonus Clupeaformis} ({M}itchill), in {L}ake {E}rie}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'pages = {178-249}, ' ...
'volume = {77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coregonus-clupeaformis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_clupeaformis/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

