function [data, auxData, metaData, txtData, weights] = mydata_Parablennius_ruber

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Blenniiformes'; 
metaData.family     = 'Blenniidae';
metaData.species    = 'Parablennius_ruber'; 
metaData.species_en = 'Portugese blenny'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd', 'jiMi'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 06];

%% set data
% zero-variate data

data.ab = 15.5;   units.ab = 'd';   label.ab = 'age at birth';              bibkey.ab = 'FariGil2010';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'except for ab, all temps are guessed; guess for am based on longlivety of Salaria pavo, pers obs';
  
data.Lb  = 0.41;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'FariGil2010'; 
  comment.Lb = 'yolk sac absorbed and mouth open at hatch';
data.Lj  = 1.6;   units.Lj  = 'cm';  label.Lj  = 'total length at metam';  bibkey.Lj  = 'AzevHome2002'; 
data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'AzevHome2002'; 
data.Li  = 14.1;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'AzevHome2002';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'FariGil2010';
  comment.Wwb = 'based on egg length of 1.1 mm and width 0.6 mm: 4/3*pi*0.03^2*0.055';
data.Wwi = 28;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AzevHome2002';
  comment.Wwi = 'based on W = 0.011 * TL^2.96, see F3';

data.GSI  = 0.06; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'AzevHome2002';   
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% time-length
data.tL_1994 = [ ... % time since birth (yr), total length (cm)
0.4 4.5
0.5 5.1
0.6 5.7
0.7 6.7
0.9 7.2
1.0 7.1
1.1 7.3
1.2 7.8
1.3 7.9
1.4 8.4
1.6 9.0];
data.tL_1994(:,1) = 365 * (.4 + data.tL_1994(:,1)); % convert yr to d
units.tL_1994   = {'d', 'cm'};  label.tL_1994 = {'time since birth', 'total length', '1994 females'};  
temp.tL_1994    = C2K(17);  units.temp.tL_1994 = 'K'; label.temp.tL_1994 = 'temperature';
bibkey.tL_1994 = 'AzevHome2002';
comment.tL_1994 = 'data for the 1994 cohort';
%
data.tL_1993 = [ ... % time since birth (yr), total length (cm)
0.8 7.2
1.1 6.7
1.2 7.7
1.25 7.6
1.3 7.6
1.4 8.8
1.5 9.3
1.6 9.1];
data.tL_1993(:,1) = 365 * (.4 + data.tL_1993(:,1)); % convert yr to d
units.tL_1993   = {'d', 'cm'};  label.tL_1993 = {'time since birth', 'total length', '1993 females'};  
temp.tL_1993    = C2K(17);  units.temp.tL_1993 = 'K'; label.temp.tL_1993 = 'temperature';
bibkey.tL_1993 = 'AzevHome2002';
comment.tL_1993 = 'data for the 1993 cohort';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1994','tL_1993'}; subtitle1 = {'data for cohorts 1994, 1993'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'range of depths: 0-20 m';
metaData.bibkey.F1 = 'Wiki';
F2 = 'length-weight: W = 0.011 * TL^2.963';
metaData.bibkey.F2 = 'AzevHome2002';
F3 = 'Males guard egg batches from January to May/June';
metaData.bibkey.F3 = 'FariGil2010';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6TNQX'; % Cat of Life
metaData.links.id_ITIS = '636477'; % ITIS
metaData.links.id_EoL = '46573623'; % Ency of Life
metaData.links.id_Wiki = 'Parablennius_ruber'; % Wikipedia
metaData.links.id_ADW = 'Parablennius_ruber'; % ADW
metaData.links.id_Taxo = '182612'; % Taxonomicon
metaData.links.id_WoRMS = '126774'; % WoRMS
metaData.links.id_fishbase = 'Parablennius-ruber'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parablennius_ruber}}';
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
bibkey = 'AzevHome2002'; type = 'Article'; bib = [ ... 
'author = {J. M. N. Azevedo and N. Homem}, ' ... 
'year = {2002}, ' ...
'title = {AGE AND GROWTH, REPRODUCTION AND DIET OF THE RED BLENNY \emph{Parablennius ruber} ({B}LENNIIDAE)}, ' ...
'journal = {Cybium}, ' ...
'volume = {26}, ' ...
'pages = {129--133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FariGil2010'; type = 'Article'; bib = [ ... 
'author = {C. Faria and F. Gil and R. S. Santos and V. C. Almada}, ' ... 
'year = {2010}, ' ...
'title = {A comparison between the ontogeny of two related blenniid species \emph{Parablennius gattorugine} and \emph{Parablennius ruber} ({P}isces: {B}lenniidae)}, ' ...
'journal = {J Mar Bio Assoc UK}, ' ...
'volume = {90}, ' ...
'pages = {1263--1268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/16330}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

