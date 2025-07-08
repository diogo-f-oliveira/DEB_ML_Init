function [data, auxData, metaData, txtData, weights] = mydata_Glaucomys_sabrinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Glaucomys_sabrinus'; 
metaData.species_en = 'Northern flying squirrel'; 

metaData.ecoCode.climate = {'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 02];              

%% set data
% zero-variate data

data.tg = 40;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 68;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 210;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14.2*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 5.5;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 39.74;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 149;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3*1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 1 litters per yr';
   
% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
    3   6.5
    5   8.2
    8   9.2
    9   9.7
   11  11.2
   14  13.8
   15  15.0
   16  15.3
   18  16.5
   21  19.3
   23  20.5
   25  20.6
   32  23.5
   35  24.7
   37  24.9
   39  25.7
   41  26.4
   44  27.3
   49  28.0
   56  28.9
   64  27.0
   71  34.8
   78  36.3
   85  35.5
   92  42.0
  123  56.2
  153  70.3
  184  80.5
  214  88.8
  245  92.0
  276 102.3
  304 103.0
  335  96.0
  365  84.0
    3   5.6
    5   6.8
    8   7.5
    9   7.5
   11   8.9
   14  10.5
   15  11.6
   16  12.0
   18  13.8
   21  15.9
   23  16.1
   25  17.3
   32  19.8
   35  21.1
   37  21.8
   39  22.3
   41  23.5
   44  24.9
   49  25.5
   56  27.8
   64  27.0
   71  32.5
   78  35.2
   85  34.0
   92  38.0
  123  51.4
  153  66.5
  184  80.0
  214  72.2
  245  56.0
  276  91.2
  304  92.0
  335  90.0
  365  76.0];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(39);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Boot1946';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
    1   6.0
    2   7.1
    3   8.0
    5   9.5
    8  10.65
    9  11.1
   11  12.9
   14  15.4
   15  17.1
   16  17.5
   18  19.4
   21  22.0
   23  22.8
   25  23.6
   32  26.0
   35  27.1
   37  26.7
   39  27.9
   41  29.2
   44  30.0
   49  34.0
   56  32.0
   64  30.5
   71  37.2
   78  41.0
   85  42.5
   92  45.0
  123  58.0
  153  72.3
  184  88.0
  214  82.0
  245  83.0
  276  97.0
  304 107.5
  335 116.0
  365 104.0];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(39);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Boot1946';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 10 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is assumed to be the same as for Glaucomys_volans';
D2 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3G6FP'; % Cat of Life
metaData.links.id_ITIS = '180169'; % ITIS
metaData.links.id_EoL = '347430'; % Ency of Life
metaData.links.id_Wiki = 'Glaucomys_sabrinus'; % Wikipedia
metaData.links.id_ADW = 'Glaucomys_sabrinus'; % ADW
metaData.links.id_Taxo = '61978'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12400302'; % MSW3
metaData.links.id_AnAge = 'Glaucomys_sabrinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glaucomys_sabrinus}}';
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
bibkey = 'Boot1946'; type = 'Article'; bib = [ ...  
'author = {Ernest S. Booth}, ' ...
'year = {1946}, ' ...
'title  = {Notes on the Life History of the Flying Squirrel}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {27(1)}, ' ...
'pages = {28-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Glaucomys_sabrinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

