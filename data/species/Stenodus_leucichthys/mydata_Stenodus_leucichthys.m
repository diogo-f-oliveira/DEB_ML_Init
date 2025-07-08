  function [data, auxData, metaData, txtData, weights] = mydata_Stenodus_leucichthys
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Stenodus_leucichthys'; 
metaData.species_en = 'Inconnu'; 

metaData.ecoCode.climate = {'MC', 'ME', 'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'MPNE','MPNW','TH'};
metaData.ecoCode.habitat = {'0jFr', '0iFe', 'jiMpe'};
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
metaData.date_subm = [2020 10 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 09]; 

%% set data
% zero-variate data
data.am = 22*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fisbase';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 70;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
  comment.Lp = '28 to 34 cm';
data.Li = 150;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 3.13e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00407*Lp^3.19, see F1';
data.Wwi = 35.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00407*Li^3.19, see F1';
    
data.Ri = 420e3/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time (yy), fork length (cm)
    1  15.1
    2  23.9
    3  30.7
    4  36.9
    5  43.0
    6  48.9
    7  54.6
    8  59.8
    9  65.2
   10  70.5
   11  75.9
   12  80.6
   13  85.5
   14  89.5
   15  93.7
   16  97.8
   17 101.6
   18 107.2
   19 110.1
   20 109.4];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.93; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Alt1973';
comment.tL = 'Data from Kobuk-Selawik Rivers';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M =  5 * weights.psd.p_M;

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
F1 = 'length-weight: Ww in g = 0.00407*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.93 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4ZYGX'; % Cat of Life
metaData.links.id_ITIS = '162006'; % ITIS
metaData.links.id_EoL = '46563188'; % Ency of Life
metaData.links.id_Wiki = 'Stenodus_leucichthys'; % Wikipedia
metaData.links.id_ADW = 'Stenodus_leucichthys'; % ADW
metaData.links.id_Taxo = '42852'; % Taxonomicon
metaData.links.id_WoRMS = '127189'; % WoRMS
metaData.links.id_fishbase = 'Stenodus-leucichthys'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Stenodus_leucichthys}}';  
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
bibkey = 'Alt1973'; type = 'Article'; bib = [ ... 
'doi = {10.1577/M08-002.1}, ' ...
'author = {Kenneth T. Alt}, ' ...
'year = {1973}, ' ...
'title = {Age and growth of the inconnu (\emph{Stenodus leucichthys}) in {A}laska}, ' ... 
'journal = {J. Fish. Res. board Can.}, ' ...
'pages = {757-459}, ' ...
'volume = {30(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Stenodus-leucichthys.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

