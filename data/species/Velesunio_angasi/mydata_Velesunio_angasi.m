function [data, auxData, metaData, txtData, weights] = mydata_Velesunio_angasi
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Hyriidae';
metaData.species    = 'Velesunio_angasi'; 
metaData.species_en = 'Freshwater mussel'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 11]; 

%% set data
% zero-variate data

data.am = 35*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'HumpSimp1985';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.0;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'HumpSimp1985';
data.Li  = 8.05;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'HumpSimp1985';

data.Wwb = 7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Based on 306 till 309 mum glochidium length, but rather flat: 0.5*4/3*pi*0.015^3';
data.Wdi = 1.527; units.Wdi = 'g';   label.Wdi = 'ultimate flesh dry weight at SL 6.3 cm';   bibkey.Wdi = 'HumpSimp1985';
  comment.Wdi = 'Based on Mudginberri data at 32.5 yr of age';
  
data.Ri  = 155e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on value for kap';
  
% uni-variate data

% time-length
data.tL_Ge  = [ ... % time since settlement (yr), shell length (cm)
    0.52 1.95
    1.36 4.06
    2.41 4.88
    3.51 5.27
    4.39 5.44
    5.49 5.58
    6.56 5.74
    7.49 5.85
    8.50 6.00
    9.49 6.00
   10.45 6.15
   11.49 6.10
   12.44 6.26
   13.47 6.31
   14.45 6.43
   15.44 6.29
   16.49 6.45
   17.54 6.73
   18.41 6.74
   19.61 6.95
   20.02 6.70
   22.46 6.88];
data.tL_Ge(:,1) = data.tL_Ge(:,1) * 365; % convert yr to d 
units.tL_Ge   = {'d', 'cm'};  label.tL_Ge = {'time since birth', 'shell length', 'Georgetown Billabong'};  
temp.tL_Ge    = C2K(26);  units.temp.tL_Ge = 'K'; label.temp.tL_Ge = 'temperature';
bibkey.tL_Ge = 'HumpSimp1985';
comment.tL_Ge = 'Data for Georgetown Billabong';
%
data.tL_Gu = [ ... % time since settlement (yr), shell length (cm)
    0.75 4.03
    1.76 5.12
    2.76 5.45
    4.67 5.60
    5.76 6.30
    6.76 6.30
    7.75 6.20
    8.71 6.56
    9.63 6.50
   10.63 6.30
   11.73 7.25
   12.63 7.25];
data.tL_Gu(:,1) = data.tL_Gu(:,1) * 365; % convert yr to d 
units.tL_Gu   = {'d', 'cm'};  label.tL_Gu = {'time since birth', 'shell length', 'Gulungul Billabong'};  
temp.tL_Gu    = C2K(26);  units.temp.tL_Gu = 'K'; label.temp.tL_Gu = 'temperature';
bibkey.tL_Gu = 'HumpSimp1985';
comment.tL_Gu = 'Data for Gulungul Billabong';
%
data.tL_Co = [ ... % time since settlement (yr), shell length (cm)
    0.53 3.55
    1.34 3.84
    2.60 4.68
    3.46 4.97
    4.54 5.17
    5.53 5.36
    6.54 5.64
    7.43 5.82
    8.39 6.00
    9.28 5.98
   10.20 5.97
   11.17 5.96
   12.21 6.37
   13.30 6.69
   14.29 6.90
   15.50 7.05
   12.35 6.62
   14.29 6.90
   15.50 7.05
   16.35 6.62
   17.52 6.90
   19.64 8.00];
data.tL_Co(:,1) = data.tL_Co(:,1) * 365; % convert yr to d 
units.tL_Co   = {'d', 'cm'};  label.tL_Co = {'time since birth', 'shell length', 'Corndorl Billabong'};  
temp.tL_Co    = C2K(26);  units.temp.tL_Co = 'K'; label.temp.tL_Co = 'temperature';
bibkey.tL_Co = 'HumpSimp1985';
comment.tL_Co = 'Data for Corndorl Billabong';
%
data.tL_Ma = [ ... % time since settlement (yr), shell length (cm)
    0.97 2.95
    1.50 3.96
    2.46 4.59
    3.54 4.98
    4.53 5.19
    5.54 5.39
    6.49 5.56
    7.52 5.66
    8.54 5.68
    9.53 5.82
   10.38 5.83
   11.73 6.07
   12.46 5.70];
data.tL_Ma(:,1) = data.tL_Ma(:,1) * 365; % convert yr to d 
units.tL_Ma   = {'d', 'cm'};  label.tL_Ma = {'time since birth', 'shell length', 'Magela Creek Channel'};  
temp.tL_Ma    = C2K(26);  units.temp.tL_Ma = 'K'; label.temp.tL_Ma = 'temperature';
bibkey.tL_Ma = 'HumpSimp1985';
comment.tL_Ma = 'Data for Magela Creek Channel';
%
data.tL_Mu = [ ... % time since settlement (yr), shell length (cm)
    0.37 2.27
    1.37 4.49
    2.40 4.87
    3.45 5.29
    4.50 5.47
    5.44 5.53
    6.50 5.72
    7.48 5.83
    8.48 5.90
    9.45 5.89
   10.44 6.01
   11.50 6.15
   12.50 6.08
   12.50 6.15
   14.50 6.10
   15.41 6.26
   16.37 6.27
   17.34 6.31
   18.47 6.40
   19.47 6.36
   20.46 6.29
   21.46 6.36
   22.53 6.43
   23.33 6.51
   24.52 6.49
   25.43 6.24
   27.37 6.62
   28.55 6.63
   29.41 6.90
   32.43 6.30];
data.tL_Mu(:,1) = data.tL_Mu(:,1) * 365; % convert yr to d 
units.tL_Mu   = {'d', 'cm'};  label.tL_Mu = {'time since birth', 'shell length', 'Mudginberri Billabong'};  
temp.tL_Mu    = C2K(26);  units.temp.tL_Mu = 'K'; label.temp.tL_Mu = 'temperature';
bibkey.tL_Mu = 'HumpSimp1985';
comment.tL_Mu = 'Data for Mudginberri Billabong';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = weights.Ri * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
data.psd.p_M = 3 * data.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Ge', 'tL_Gu', 'tL_Co', 'tL_Ma', 'tL_Mu'}; subtitle1 = {'Data from Georgetown, Gulungul, Corndorl, Magela, Mudginberri'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Rarely hermaphroditic (less than 2 percent';
metaData.bibkey.F1 = 'HumpSimp1985'; 
metaData.facts = struct('F1',F1);  

%% Links
metaData.links.id_CoL = '7FKQ8'; % Cat of Life
metaData.links.id_ITIS = '983795'; % ITIS
metaData.links.id_EoL = '4752446'; % Ency of Life
metaData.links.id_Wiki = 'Velesunio'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3405779'; % Taxonomicon
metaData.links.id_WoRMS = '1306742'; % WoRMS
metaData.links.id_molluscabase = '1306742'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Velesunio}}';
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
bibkey = 'HumpSimp1985'; type = 'techreport'; bib = [ ... 
'author = {C. L. Humphrey and R. D. Simpson}, ' ... 
'year = {1985}, ' ...
'title = {The biology and ecology of \emph{Velesunio angasi} ({B}ivalvia: {H}yriidae) in the {M}agela {C}reek, {N}orthern {T}erritory}, ' ...
'institution = {Supervising Scientist for the Alligator Rivers Region}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

