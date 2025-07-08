function [data, auxData, metaData, txtData, weights] = mydata_Branchinecta_orientalis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Branchinectidae';
metaData.species    = 'Branchinecta_orientalis'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'THp','TPi'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; 'T-ab'; 'T-ap'; 'T-am'; 'T-Ri'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 17]; 

%% set data
% zero-variate data

data.Lb  = 0.043; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'AtasAgh2012';
data.Lp  = 1.25;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AtasAgh2012';
data.Li  = 1.7;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'AtasAgh2012';
  
data.Wwb  = 1.575e-5;  units.Wwb  = 'g';  label.Wwb  = 'dry weight at birth';   bibkey.Wwb  = 'AtasAgh2012';
  comment.Wwb = 'based in cyst diameter of 311 mum: pi/6*0.0311^3';
data.Wdi  = 0.0075;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(1.64/1)^3';

% uni-variate data
% time-length
data.tL = [ ... % instar (#), length (mm)
    1  0.43  0.43  0.43  0.43  0.43  0.43
    3  0.92  1.23  1.44  1.71  1.94  1.68
    9  1.97  3.52  4.77  5.22  7.45  7.83
   15  4.07  9.20 10.17  9.98 10.69 12.38
   21  8.61 11.00 11.68 11.40 12.42 NaN
   27 11.08 12.34 12.79 12.59 13.59 NaN
   33 13.25 13.49 13.82 13.15 14.75 NaN
   39 14.97 14.60 15.49 14.42 NaN   NaN
   45 15.57 15.20 16.34 15.97 NaN   NaN
   51 15.76 16.03 16.71 16.49 NaN   NaN
   57 15.88 16.37 NaN   NaN   NaN   NaN
   63 15.95 16.42 NaN   NaN   NaN   NaN];
data.tL =  data.tL(:,[1 7 6 5 4 3 2]); % re-arrance cols from high to low temp
data.tL(:,2:7) = data.tL(:,2:7)/10; % convert mm to cm
units.tL   = {'d', 'cm'}; label.tL = {'time since birth', 'length'};  
temp.tL = C2K([27 24 21 18 15 12]); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'AtasAgh2012'; 
treat.tL = {1 {'27 C','24 C','21 C','18 C','15 C','12 C'}}; label.treat.tL = 'temperature';

% temperature-age at birth
data.Tab = [ ... % temperature (C), age at birth (h)
    12 126.00
    15  78.00
    18  54.00
    21  48.00
    24  48.00
    27  48.00];
data.Tab(:,2) = data.Tab(:,2)/24; % conver h to d
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'AtasAgh2012'; 

% temperature-time since birth at puberty (d)
data.Ttp = [ ... % temperature (C), time since birth at puberty (d)
    12 29.86
    15 28.07
    18 22.42
    21 24.63
    24 17.38
    27  9.38];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'AtasAgh2012'; 

% temperature-life span (d)
data.Tam = [ ... % temperature (C), life span (d)
    12 63.00
    15 62.67
    18 51.00
    21 51.00
    24 33.35
    27 14.67];
units.Tam   = {'C', 'd'};  label.Tam = {'temperature', 'life span'};  
bibkey.Tam = 'AtasAgh2012'; 

% temperature-reprod rate
data.TRi = [ ... % temperature (C), reprod rate (#/d)
    12 18.11
    15 21.86
    18 38.60
    21 28.73
    24 18.54
    27  5.33];
units.TRi   = {'C', '#/d'};  label.TRi = {'temperature', 'reproduction rate'};  
bibkey.TRi = 'AtasAgh2012'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 30 * weights.tL; 
weights.TRi(end-2:end) = 0; 
%weights.Tab = 0 * weights.Tab;
%weights.Ttp = 0 * weights.Ttp;
weights.Lp = 0 * weights.Lp;
weights.Wwb = 0 * weights.Wwb;
weights.Lb = 0 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = 'N6GZ'; % Cat of Life
metaData.links.id_ITIS = '1123802'; % ITIS
metaData.links.id_EoL = '327143'; % Ency of Life
metaData.links.id_Wiki = 'Branchinecta'; % Wikipedia
metaData.links.id_ADW = 'Branchinecta_orientalis'; % ADW
metaData.links.id_Taxo = '755134'; % Taxonomicon
metaData.links.id_WoRMS = '1214301'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AtasAgh2012'; type = 'Article'; bib = [ ... 
'doi = {10.1163/15685403-00003115}, ' ...
'author = {Behroz Atashbar and Naser Agh and Lynda Beladjal and Reza Jalili and Johan Mertens}, ' ... 
'year = {2012}, ' ...
'title = {Effects of temperature on survival, growth, reproductive and life span characteristics of \emph{Branchinecta orientalis} {G}. {O}. {S}ars, 1901 ({B}ranchipoda, {A}nostraca) from {I}ran}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {85(9)}, ' ...
'pages = {1099-1114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
