function [data, auxData, metaData, txtData, weights] = mydata_Oncorhynchus_clarkii_stomias

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Oncorhynchus_clarkii_stomias'; 
metaData.species_en = 'Greenback cutthroat trout'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc', 'oiFr', 'oiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCii', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(7); 
metaData.data_0     = {'ah';  'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L_T'; 't-Ww_T';}; % tags for different types of uni-variate data

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Chiara Accolla'};    
metaData.date_subm = [2018 11 28];              
metaData.email    = {'caccolla@umn.edu'};            
metaData.address  = {'EEB,University of Minnesota'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 04]; 


%% set data
% zero-variate data

  
  data.ah = 40; units.ah = 'd'; label.ah = 'age hatching'; bibkey.ah = 'ColeFaus2007'; 
    temp.ah = C2K(10) ; units.temp.ah = 'K'; label.temp.ah = 'temperature hatching';
  data.ab = 61.5 ;    units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'ColeFaus2007';  
    temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'Value based on a mean of days from hatching to swim-up for O. c. pleuriticus, which is a very closed related subspecies with similar ecologies, inhabiting the same region. Time for hatching is considered about 30-40 days (other paper of Coleman and Fausch, 2007, Transactions of the American Fisheries Society, 136:5, 1231-1244)';  
  data.ap = 974;    units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'Youn2009';
    temp.ap = C2K(7);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  data.am = 4076.5;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'Youn2009';           
    temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
  data.Lb =  2.25;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ColeFaus2007';
  data.Lp  = 12.7 ;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Youn2009';
    comment.Lp = 'The paper of Robert House (1995), North American Journal of Fisheries Management, was also useful to have an estimation of Lp';
  data.Li  = 25; units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Youn2009';
 
  data.Wwb = 0.08;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'ColeFaus2007';  
  data.Wwp = 17;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp='ScarBerg1986'; 
    comment.Wwp = 'guessed estimation considering the average of individual weights of organisms of 2-3 years old, taken in the months of end of September/ October (average age of puberty) ';
  data.Wwi = 150;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'CartBeau1998';
    comment.Wwi = 'guessed estimationc, Poor quality data available';

  data.Ri  = 281/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Youn2009';  
    temp.Ri = C2K(7);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'Ri is an estimation based on high-elevation streams cutthroats. For Colorado River cutthroat fecundity ranges from 95 to 281';


%% Uni-variated data
%age - Length - Weight from three different temperatures (T1,T2,T3)

    %cold regime
    tLWT1 = [ ...
    61.5   2.27  0.07  6.37 
    89.5   2.47  0.09  3.94 
    194.5  3.05  0.18  0.28
    ];

    data.tL_1 = tLWT1(:,[1 2]); units.tL_1 = {'d', 'cm'}; label.tL_1 = {'age', 'total length'};  bibkey.tL_1= {'ColeFaus2007'};
    tT.tL_1   = tLWT1(:,[1 4]); units.tT.tL_1 = {'d', 'Celsius'}; label.tT.tL_1  = {'age', 'temperature'};

%     % initial point as auxData in order to start graphs from this point in predict file
%     initL.tL_1 = data.tL_1(1,2); units.initL.tL_1 = 'cm'; label.initL.tL_1 = 'total length';
%   

    data.tW_1 = tLWT1(:,[1 3]); units.tW_1 = {'d', 'g'}; label.tW_1 = {'age', 'wet weight'};  bibkey.tW_1= {'ColeFaus2007'};
    tT.tW_1 = tLWT1(:,[1 4]);  units.tT.tW_1 = {'d', 'Celsius'}; label.tT.tW_1  = {'age', 'temperature'};

    %intermediate regime
    tLWT2 = [ ...
    61.5   2.3   0.068   8.13  
    110.2  2.92  0.177   3.94
    208.5  3.5   0.3     0.4
    ];
    data.tL_2 = tLWT2(:,[1 2]); units.tL_2 = {'d', 'cm'}; label.tL_2 = {'age', 'total length'};  bibkey.tL_2= {'ColeFaus2007'};
%     initL.tL_2 = data.tL_2(1,2);  units.initL.tL_2 = 'cm'; label.initL.tL_2 = 'total length';
    tT.tL_2 = tLWT2(:,[1 4]);  units.tT.tL_2 = {'d', 'Celsius'}; label.tT.tL_2  = {'age', 'temperature'};

    data.tW_2 = tLWT2(:,[1 3]);  units.tW_2 = {'d', 'g'}; label.tW_2 = {'age', 'wet weight'};  bibkey.tW_2= {'ColeFaus2007'};
    tT.tW_2 = tLWT2(:,[1 4]);  units.tT.tW_2 = {'d', 'Celsius'}; label.tT.tW_2  = {'age', 'temperature'};

    %warm regime
    tLWT3 = [ ...
    61.5   2.22 0.068  10    
    143.4  4.0  0.46   3.94
    217.1  4.45 0.62   0.24
    ];
    data.tL_3 = tLWT3(:,[1 2]);  units.tL_3 = {'d', 'cm'}; label.tL_3 = {'age', 'total length'};  bibkey.tL_3= {'ColeFaus2007'};
%     initL.tL_3 = data.tL_3(1,2); units.initL.tL_3 = 'cm'; label.initL.tL_3 = 'total length';
    tT.tL_3 = tLWT3(:,[1 4]); units.tT.tL_3 = {'d', 'Celsius'}; label.tT.tL_3  = {'time', 'temperature'};

    data.tW_3 = tLWT3(:,[1 3]); units.tW_3 = {'d', 'g'}; label.tW_3 = {'age', 'wet weight'};  bibkey.tW_3= {'ColeFaus2007'};
    tT.tW_3 = tLWT3(:,[1 4]); units.tT.tW_3 = {'d', 'Celsius'}; label.tT.tW_3  = {'time', 'temperature'};

%% Age weight
% t-W data. Estimated from one river
data.tW = [ 1*365 2*365 3*365 4*365 5*365; 1.7 15.3 23.0 45.5 68.3
    ]';  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  bibkey.tW = 'ScarBerg1986';
temp.tW    = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
comment.tW = 'Only mesures taken in August have been considered, to be sure that E_r = 0 (spawning concludes in late July). The temperature is then always the same and f can be considered constant for this set of data';

%% Temperature Weight
% % T-W data

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi=0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
% auxData.initL = initL;
auxData.tT = tT;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% 
 %% Discussion points
D1 = 'The species is threatened, very few data are available. O. C. pleuriticus has been used for extrapolating some data (all those based on Youn2009 and age-lenght-weight univariated data.) ';
D2 = 'Age of first reproduction is about 3-4 years old';
D3 = 'Temperature for hatching calculated considering that hatching occurs usually in late August' ;
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6SN65'; % Cat of Life
metaData.links.id_ITIS = '201901'; % ITIS
metaData.links.id_EoL = '2777842'; % Ency of Life
metaData.links.id_Wiki = 'Oncorhynchus_clarkii_stomias'; % Wikipedia
metaData.links.id_ADW = 'Oncorhynchus_clarkii'; % ADW
metaData.links.id_WoRMS = '274347'; % WoRMS
metaData.links.id_Taxo = '982678'; % Taxonomicon
metaData.links.id_fishbase = 'Oncorhynchus-clarkii'; % fishbase

%% References%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Greenback_cutthroat_trout}}';
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

bibkey = 'ColeFaus2007'; type = 'Article'; bib = [ ... 
'author = {Coleman, M.A. and Fausch, K.D.}, ' ... 
'year = {2007}, ' ...
'title = {Cold summer temperature regimes cause a recruitment bottleneck in age-0 {C}olorado {R}iver cutthroat trout reared in laboratory streams}, ' ...
'journal = {Transactions of the american fisheries society}, ' ...
'volume = {136}, ' ...
'number = {3}, '...
'pages = {639-654}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Youn2009'; type = 'misc'; bib = [ ... 
'author = {Young, M.K.}, ' ... 
'year = {2009}, ' ...
'title = {Greenback cutthroat trout (\emph{Oncorhynchus clarkii stomias}): A technical conservation assessment}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'WangWhit1994'; type = 'Article'; bib = [ ... 
'author = {Wang, L. and White, R.J.}, ' ... 
'year = {1994}, ' ...
'title = {Competition betwenn wild brown trout and hatchery greenback cutthroat trout of largely wild parentage}, ' ...
'journal = {North american journal of fisheries management}, ' ...
'volume = {14}, ' ...
'number = {3}, '...
'pages = {475-487}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'CartBeau1998'; type = 'Article'; bib = [ ... 
'author = {Cartwright, M.A. and Beauchamp, D.A. and Bryant M.D.}, ' ... 
'year = {1998}, ' ...
'title = {Quantifying cutthroat trout (\emph{Oncorhynchus clarkii}) predation on sockeye salmon (\emph{Oncorhynchus nerka}) fry using a bioenergetics approach}, ' ...
'journal = {Canadian journal of fisheries and aquatic sciences}, ' ...
'volume = {55}, ' ...
'number = {5}, '...
'pages = {1285-1295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'ScarBerg1986'; type = 'Article'; bib = [ ... 
'author = {Scarnecchia, D. L. and Bergersen, E. P.}, ' ... 
'year = {1986}, ' ...
'title = {Production and habitat of threatened greenback and {C}olorado {R}iver cutthroat trouts in {R}ocky {M}ountain headwater streams}, ' ...
'journal = {Transactions of the american fisheries society}, ' ...
'volume = {115}, ' ...
'number = {3}, '...
'pages = {382-391}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
