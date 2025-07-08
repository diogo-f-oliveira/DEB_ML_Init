function [data, auxData, metaData, txtData, weights] = mydata_Lemiox_rimosus

% http://www.debtheory.org/wiki/index.php?title=Mydata_file#Metadata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Lemiox_rimosus'; 
metaData.species_en = 'Birdwing pearlymussel'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'jiFr'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'};
metaData.data_1     = {'t-L_f'; 'L_N_f'}; 

metaData.COMPLETE = 2.6; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2020 10 06];      


%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'JoneNeve2010';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .0254;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Jirk1986';  
  comment.Lb = 'value for Actinonaias_ligamentina';
data.Lp  = 2.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'JoneNeve2010'; 
data.Li  = 5.2;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'JoneNeve2010';

data.Wwi = 7.51;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';
  comment.Wwi = 'Wet weight includes shell and environmental water';

% uni-variate data
  
% time-length
data.tL_Df = [ ... % year class (yr), shell length (cm)
    0 0.77
    1 1.82
    2 2.59
    3 3.03
    4 3.17
    5 3.28
    6 3.41
    7 3.55
    8 3.65
    9 3.73
   10 3.94];
data.tL_Df(:,1) = 365 * (0.8 + data.tL_Df(:,1));
units.tL_Df = {'d', 'cm'}; label.tL_Df = {'time', 'shell length', 'female'};  
temp.tL_Df = C2K(17);  units.temp.tL_Df = 'K'; label.temp.tL_Df = 'temperature';
bibkey.tL_Df = 'JoneNeve2010';
comment.tL_Df = 'Data for females in Duck River';
%
data.tL_Dm = [ ... % year class (yr), shell length (cm)
    0 0.82
    1 1.83
    2 2.92
    3 3.37
    4 3.99
    5 4.19
    6 4.37
    7 4.56
    8 4.96
    9 5.28
   10 5.07];
data.tL_Dm(:,1) = 365 * (0.8 + data.tL_Dm(:,1));
units.tL_Dm = {'d', 'cm'}; label.tL_Dm = {'time', 'shell length', 'male'};  
temp.tL_Dm = C2K(17);  units.temp.tL_Dm = 'K'; label.temp.tL_Dm = 'temperature';
bibkey.tL_Dm = 'JoneNeve2010';
comment.tL_Dm = 'Data for males in Duck River';
%
data.tL_Cf = [ ... % tyear class (yr), shell length (cm)
    0 0.83
    1 1.70
    2 2.22
    3 2.52
    4 2.75
    5 2.75
    6 2.91
    7 3.03
    8 3.31
    9 3.06
   10 3.45
   11 3.52];
data.tL_Cf(:,1) = 365 * (0.8 + data.tL_Cf(:,1));
units.tL_Cf = {'d', 'cm'}; label.tL_Cf = {'time', 'shell length', 'female'};  
temp.tL_Cf = C2K(17);  units.temp.tL_Cf = 'K'; label.temp.tL_Cf = 'temperature';
bibkey.tL_Cf = 'JoneNeve2010';
comment.tL_Cf = 'Data for females in Clinch River';
%
data.tL_Cm = [ ... % year class (yr), shell length (cm)
    0 0.94
    1 1.54
    2 2.24
    3 2.72
    4 3.10
    5 3.21
    6 3.72
    7 3.60
    8 3.75
    9 4.00
   10 4.25
   11 4.92];
data.tL_Cm(:,1) = 365 * (0.8 + data.tL_Cm(:,1));
units.tL_Cm = {'d', 'cm'}; label.tL_Cm = {'time', 'shell length', 'male'};  
temp.tL_Cm = C2K(17);  units.temp.tL_Cm = 'K'; label.temp.tL_Cm = 'temperature';
bibkey.tL_Cm = 'JoneNeve2010';
comment.tL_Cm = 'Data for males in Clinch River';

% length - fecundity
data.LN_D = [ ... % shell length (cm), glochidia (#)
    3.27 10744
    3.45 10320
    2.73  7066
    3.95 21800
    4.23 13530
    4.30 58700];
units.LN_D = {'cm', '#'}; label.LN_D = {'shell length', 'glochidia'};  
temp.LN_D = C2K(17);  units.temp.LN_D = 'K'; label.temp.LN_D = 'temperature';
bibkey.LN_D = 'JoneNeve2010';
comment.LN_D = 'Data for males in Duck River';
%
data.LN_C = [ ... % shell length (cm), glochidia (#)
    3.80 6479
    3.52 4132];
units.LN_C = {'cm', '#'}; label.LN_C = {'shell length', 'glochidia'};  
temp.LN_C = C2K(17);  units.temp.LN_C = 'K'; label.temp.LN_C = 'temperature';
bibkey.LN_C = 'JoneNeve2010';
comment.LN_C = 'Data for males in Clinch River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Df = 5 * weights.tL_Df;
weights.tL_Dm = 5 * weights.tL_Dm;
weights.tL_Cf = 5 * weights.tL_Cf;
weights.tL_Cm = 5 * weights.tL_Cm;
weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Df', 'tL_Dm'}; subtitle1 = {'Data for females, males in Duck river'};
set2 = {'tL_Cf', 'tL_Cm'}; subtitle2 = {'Data for females, males in Clinch river'};
set3 = {'LN_D', 'LN_C'};   subtitle3 = {'Data for Duck, Clinch river'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Can shape its mantle in the form of a snail to attract fish for hosting its glochidia'; 
metaData.bibkey.F1 = 'EoL'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3T4P4'; % Cat of Life
metaData.links.id_ITIS = '80255'; % ITIS
metaData.links.id_EoL = '449329'; % Ency of Life
metaData.links.id_Wiki = 'Lemiox_rimosus'; % Wikipedia
metaData.links.id_ADW = 'Lemiox_rimosus'; % ADW
metaData.links.id_Taxo = '435344'; % Taxonomicon
metaData.links.id_WoRMS = '857336'; % WoRMS
metaData.links.id_molluscabase = '857336'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lemiox_rimosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/449329}}';
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
bibkey = 'JoneNeve2010'; type = 'Article'; bib = [ ... 
'author = {Jess W. Jones and Richard J. Neves and Steven A. Ahlstedt and Don Hubbs and Matt Johnson and Hua Dan and Brett J. K. Ostby}, ' ... 
'year = {2010}, ' ...
'title = {Life History and Demographics of the Endangered Birdwing Pearlymussel (\emph{Lemiox rimosus}) ({B}ivalvia: {U}nionidae)}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {163(2)}, ' ...
'pages = {335-350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jirk1986'; type = 'phdthesis'; bib = [ ... 
'author = {Kurt J. Jirka}, ' ... 
'year = {1986}, ' ...
'title = {Reproductive biology and comparative growth rates of selected species of freshwater mussels ({B}ivalvia: {U}nionidae) in the {N}ew and {G}reenbrier {R}ivers, {V}irginia and {W}est {V}irginia}, ' ...
'school = {Virginia Polytechnic Institute and State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

