function [data, auxData, metaData, txtData, weights] = mydata_Micropterus_coosae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Micropterus_coosae'; 
metaData.species_en = 'Redeye bass'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 08];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Pars1954'; 
data.Li  = 47;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.82e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 12;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Pars1954';
data.Wwi = 1.35e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.05, see F1; fishbase gives 3.7 kg';
 
data.Ri = 2334/365;   units.Ri = 'g';  label.Ri = 'Reprod rate at 98 g'; bibkey.Ri = 'Pars1954';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since hatch (yr), total length (cm)
    0  5.775
    1  8.970
    2 12.760
    3 16.603
    4 19.878
    5 20.543
    7 21.200];
data.tL(:,1) = (.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'Knig2011'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Knig2011';
%
data.tL1 = [ ... % time since hatch (yr), total length (cm)
    1  3.1
    2  6.1
    3  8.5
    4 10.4
    5 12.3
    6 15.0
    7 16.7
    8 18.0
    9 19.6
   10 21.1];
data.tL1(:,1) = (-.4 + data.tL1(:,1)) * 365; % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length', 'Pars1954'};  
temp.tL1    = C2K(25);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Pars1954';

% length - weight
data.LWw = [ ... %  total length (inch), wet weight (g)
    3.2   9
    3.6   8
    4.0  11
    4.4  17
    5.0  21
    5.5  32
    5.9  42
    6.3  51
    6.8  64
    7.4  80
    7.9  96
    8.4 118
    8.7 135
    9.2 160
    9.8 184
   10.2 208
   10.6 228];
data.LWw(:,1) = data.LWw(:,1) * 2.54; % convert inch to cm
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'Pars1954';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 3 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from Knig2011, Pars1954'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^3.05';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43538'; % Cat of Life
metaData.links.id_ITIS = '168163'; % ITIS
metaData.links.id_EoL = '207897'; % Ency of Life
metaData.links.id_Wiki = 'Micropterus_coosae'; % Wikipedia
metaData.links.id_ADW = 'Micropterus_coosae'; % ADW
metaData.links.id_Taxo = '180097'; % Taxonomicon
metaData.links.id_WoRMS = '1014837'; % WoRMS
metaData.links.id_fishbase = 'Micropterus-coosae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micropterus_coosae}}';
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
bibkey = 'Knig2011'; type = 'phdthesis'; bib = [ ... 
'author = {John Richard Knight}, ' ... 
'year = {2011}, ' ...
'title = {Age, growth, home range, movement, and habitat selection of redeye bass (Micropterus coosae) from the middle Tallapoosa River tributaries (Alabama, USA)}, ' ...
'school = {Auburn Univ.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Micropterus-coosae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pars1954'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1953)83[202:GAHOTR]2.0.CO;2}, ' ...
'author = {John W. Parsons}, ' ... 
'year = {1954}, ' ...
'title = {Growth and Habits of the Redeye Bass}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {83(1)}, ' ...
'pages = {202-211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

