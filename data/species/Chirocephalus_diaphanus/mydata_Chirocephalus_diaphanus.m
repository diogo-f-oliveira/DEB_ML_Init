function [data, auxData, metaData, txtData, weights] = mydata_Chirocephalus_diaphanus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Chirocephalus_diaphanus'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TPa','THp'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 18]; 

%% set data
% zero-variate data

data.Lb  = 0.07; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'Lake1969';
data.Lp  = 1.2;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Lake1969';
data.Li  = 4.2;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Lake1969';
  
data.Wdi  = 0.126;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(4.2/1)^3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (cm), different temperatures
    0  0.069 0.068 0.070 0.070 0.071
    5  0.201 0.176 0.171 0.142 0.141
   10  0.622 0.588 0.377 0.235 0.231
   15  0.845 0.771 0.578 0.417 0.378
   20  1.100 1.013 0.816 0.563 0.480
   25  1.202 1.090 0.950 0.607 0.540
   30  1.241 1.171 1.036 0.801 0.680
   35  NaN   NaN   NaN   1.010 0.741];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length','female'};  
temp.tL = C2K([25 20 15 10 5]); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Lake1969'; treat.tL = {1 {'25 C','20 C','15 C','10 C','5 C'}};
label.treat.tL = 'temperature';

% temperature-time since birth at puberty-life span
data.Ttpam = [ ... % temperature (C), time since birth at puberty (d), life span (d)
    5 45 60
   10 39 65
   15 31 51
   20 25 42
   25 21 37];
units.Ttpam = {'C','d','d'}; label.Ttpam = {'temperature','time since birth at puberty','life span'};  
bibkey.Ttpam = 'Lake1969'; treat.Ttpam = {1 {'time since birth at puberty','life span'}};

% temperature-reproduction
data.TRi = [ ... % temperature (C), reprod rate (#/d)
     5  77.20/(60-45)
    10 143.33/(65-39)
    15  83.33/(61-31)
    20 113.00/(42-25)
    25  85.33/(37-21)];
units.TRi   = {'C', '#/d'}; label.TRi = {'temperature', 'reproduction rate'};  
bibkey.TRi = 'Lake1969'; %treat.TRi = {0 {}};
comment.TRi = 'based on livetime egg number per reproduction period';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
weights.Li = 5 * weights.Li; 
weights.Lb = 5 * weights.Lb; 

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
% set1 = {}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};
 
% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5Y54H'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '338917'; % Ency of Life
metaData.links.id_Wiki = 'Chirocephalus_diaphanus'; % Wikipedia
metaData.links.id_ADW = 'Chirocephalus_diaphanus'; % ADW
metaData.links.id_Taxo = '156170'; % Taxonomicon
metaData.links.id_WoRMS = '1325134'; % WoRMS

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
bibkey = 'Lake1969'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00029443}, ' ...
'author = {P. S. Lake}, ' ... 
'year = {1969}, ' ...
'title = {The effect of temperature on growth, longevity and egg production in \emph{Chirocephalus diaphanus} {P}r\''{e}vost ({C}rustacea: {A}nostraca)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {33(3-4)}, ' ...
'pages = {342–351}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%

