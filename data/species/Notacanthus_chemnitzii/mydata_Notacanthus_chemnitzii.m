  function [data, auxData, metaData, txtData, weights] = mydata_Notacanthus_chemnitzii

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Notacanthiformes'; 
metaData.family     = 'Notacanthidae';
metaData.species    = 'Notacanthus_chemnitzii'; 
metaData.species_en = 'Snub-nosed spiny eel'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpm', '0iMpb'};
metaData.ecoCode.embryo  = {'Mpm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCia'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 03 29];                           
metaData.email    = {'Bas.Kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, the Boelelaan 1085, 1081 HV Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 29]; 

%% set data
% zero-variate data
data.tj = 3*365;  units.tj = 'd';    label.tj = 'time since birth at metamorphosis from leptocephaluys to juvenile'; bibkey.tj = 'VediOrlo2016';
  temp.tj = C2K(6);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'data refers to related species; actual time unkown';
data.tp = 18*365; units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = {'VediOrlo2016'};
  temp.tp = C2K(6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
%data.tpm = 14*365;units.tpm = 'd';    label.tpm = 'time since metam at puberty';   bibkey.tpm = {'VediOrlo2016'};
%  temp.tpm = C2K(6); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'VediOrlo2016';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 10;   units.Lj = 'cm';  label.Lj = 'total length at metam'; bibkey.Lj = 'guess';
  comment.Lj = 'guess based on fig 6 of VediOrlo2016';
data.Lp = 55;   units.Lp = 'cm';  label.Lp = 'total length at puberty for females'; bibkey.Lp = 'VediOrlo2016';
%data.Lpm = 66;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'VediOrlo2016';
data.Li = 122;  units.Li = 'cm';  label.Li = 'ultimate total length';               bibkey.Li = 'VediOrlo2016';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
 comment.Wwb = 'based on guessed egg diameter of 1 mm: 4/3*pi*0.05^3';
  
data.Ri = 1e5/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap=0.9';
 
  % univariate data
  tLW_f = [ ... % time since birth (yr), total length (cm), weight (g)
  11 101 3834 % age-determination very unsure in this individual
  12  36   74
  13  46  200
  16  69  805
  18  55  505
  22  91 1725
  24  75 1198
  26 104 2995];
  data.tL_f = tLW_f(:,[1 2]); data.tL_f(1,:)= []; data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
  units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since metam', 'total length', 'female'};  
  temp.tL_f   = C2K(6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
  bibkey.tL_f = 'VediOrlo2016';
  comment.tL_f = 'data for females';
  %
  tLW_m = [ ... % time since birth (yr), total length (cm), weight (g)
  12  36  74
  11  51  273
  14  66  682
  16  68  780
  17  74  986
  20  64  603 
  23  80 1365];
  data.tL_m = tLW_m(:,[1 2]); data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
  units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since metam', 'total length', 'male'};  
  temp.tL_m   = C2K(6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
  bibkey.tL_m = 'VediOrlo2016';
  comment.tL_m = 'data for males';
  %
  data.LW = [tLW_f(:,[2 3]); tLW_m(:,[2 3])];
  units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
  bibkey.LW = 'VediOrlo2016';

%% set weights for all real data
weights = setweights(data, []);
weights.LW = 10 * weights.LW;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are not assumed to differ from females; VediOrlo2016 give tp=18yr at Lp=55cm for females and tp=14yr at Lp=66cm for males, while the scanty data do not support enough growth differences between sexes; Lm=122cm(unsexed) is 20 cm more than their max observed length';
D2 = 'temperatures are guessed, based on deep water occurence';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts 
F1 = 'Leptocephalus larva lives in surface waters and can become larger than the adult, which lives 120 till 4900 m deep';
metaData.bibkey.F1 = 'Wiki';
F2 = 'feeds on sea anemones, molluscs and echinoderms';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Duration of the leptocephalus-stage is unkown, 3 yrs in related species';
metaData.bibkey.F3 = 'VediOrlo2016';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);
                                 
%% Links
metaData.links.id_CoL = '47RSV'; % Cat of Life
metaData.links.id_ITIS = '161690'; % ITIS
metaData.links.id_EoL = '47262068'; % Ency of Life
metaData.links.id_Wiki = 'Notacanthus_chemnitzii'; % Wikipedia
metaData.links.id_ADW = 'Notacanthus_chemnitzii'; % ADW
metaData.links.id_Taxo = '181370'; % Taxonomicon
metaData.links.id_WoRMS = '126643'; % WoRMS
metaData.links.id_fishbase = 'Notacanthus-chemnitzii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notacanthus_chemnitzii}}';  
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
bibkey = 'VediOrlo2016'; type = 'Article'; bib = [ ... 
'author = {E. V. Vedishcheva and A. M. Orlov and S. Yu. Orlov and A. O. Trofimova}, ' ... 
'year = {2016}, ' ...
'title = {First Data on the Age, Growth Processes, and Otoliths of Snub-Nosed Spiny Eel \emph{Notacanthus chemnitzii} ({N}otacanthidae)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {56}, ' ...
'pages = {890-898}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/2661}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

 
