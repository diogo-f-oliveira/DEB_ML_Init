function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_middendorffiana
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_middendorffiana'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B','C','D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 14]; 

%% set data
% zero-variate data

data.tp = 34;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'Ferr1970';   
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 100;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Ferr1970';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.10; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'Ferr1970';
data.Lp  = 0.20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'Ferr1970';
data.Li  = 0.32;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'Ferr1970';

data.Wdi  = 210;  units.Wdi = 'mug'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Ceriodaphnia_pulchella: (0.32/0.09)^3*4.668';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), length (m.u.)
 0      17
17.621	19.128
43.138	40.033
63.932	50.137
88.283	55.081];
data.tL(:,2) = data.tL(:,2)*58.8e-4; % convert m.u. to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(10); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ferr1970'; 

% length-fecundity
data.LN = [ ... % length (m.u.), eggs (#)
41.994	3.983
43.941	9.967
43.948	4.075
43.978	4.940
45.926	11.032
45.949	10.005
47.948	7.070
47.984	9.935
47.991	11.826
48.941	12.035
49.036	15.980
49.043	10.034
49.884	9.865
49.894	12.946
49.932	15.919
49.972	11.973
49.993	9.972
50.030	12.945
50.034	14.080
50.051	19.161
50.108	12.080
50.156	9.971
51.007	12.829
51.058	11.910
51.637	14.824
51.743	13.958
51.828	14.985
51.835	16.930
51.882	14.930
51.905	13.849
51.940	15.903
51.998	16.983
52.045	15.037
52.095	13.793
52.232	14.008
52.876	12.003
52.961	13.029
52.978	18.110
53.121	12.055
53.969	22.102
53.982	17.886
54.002	15.886];
data.LN(:,1) = data.LN(:,1)*58.8e-3; % convert m.u. to cm
units.LN  = {'cm','#'};  label.LN = {'length', 'number of eggs'};  
temp.LN   = C2K(10); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Ferr1970'; 
comment.LN = 'samples of 16 September of the exephippial generation';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'intermoult interval in LN data is guessed at 2 d';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '345C2'; % Cat of Life
metaData.links.id_ITIS = '83890'; % ITIS
metaData.links.id_EoL = '65484121'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_middendorffiana'; % ADW
metaData.links.id_Taxo = '347069'; % Taxonomicon
metaData.links.id_WoRMS = '593148'; % WoRMS

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
bibkey = 'Ferr1970'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://aquadocs.org/handle/1834/22519}}, ' ...
'author = {Ferrari, I.}, ' ... 
'year = {1970}, ' ...
'title = {Individual growth and seasonal cycle of \emph{Daphnia middendorffiana} in an {A}lpine lake}, ' ...
'publisher = {Freshwater Biological Association}, ' ...
'institution = {Memorie dell''Istituto Italiano di Idrobiologia Dott. Marco de Marchi 26}, ' ...
'pages = {41-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
