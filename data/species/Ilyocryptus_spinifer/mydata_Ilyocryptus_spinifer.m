function [data, auxData, metaData, txtData, weights] = mydata_Ilyocryptus_spinifer
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Ilyocryptidae';
metaData.species    = 'Ilyocryptus_spinifer'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TP','TA','TO','THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 16]; 

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Venk1990';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.tp = 3.25;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Venk1990';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 21;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Venk1990';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0370; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Venk1990';
data.Lp  = 0.0559; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Venk1990';
data.Li  = 0.085;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Venk1990';
  
data.Wdi  = 7.27;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(85/370)^3';

data.Ri = 49/(21-3.25); units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Venk1990';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 45 neonates during life time';

% uni-variate data
% time-length
data.tL = [ ... % instar (#), length (mm)
1	0.370
2	0.458
3	0.559
4	0.656
5	0.714
6	0.745
7	0.785
8	0.808
9	0.809
10	0.831
11	0.841
12	0.859
13	0.856
14	0.870
15	0.845
16	0.845];
data.tL(1:3,1) =  data.tL(1:3,1)*26/24; data.tL(4:end,1) =  data.tL(4:end,1)* 50/24 - 3*24/24; % convert instar to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Venk1990'; 
comment.tL = 'conversion of instar to d is based on 24 h for first 3 instars, 45 h for later ones';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
weights.Li = 3 * weights.Li; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '6N72P'; % Cat of Life
metaData.links.id_ITIS = '84133'; % ITIS
metaData.links.id_EoL = '1039277'; % Ency of Life
metaData.links.id_Wiki = 'Ilyocryptus'; % Wikipedia
metaData.links.id_ADW = 'Ilyocryptus_spinifer'; % ADW
metaData.links.id_Taxo = '422823'; % Taxonomicon
metaData.links.id_WoRMS = '933275'; % WoRMS

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
bibkey = 'Venk1990'; type = 'Article'; bib = [ ... 
'author = {Krishnamoorthy Venkataraman}, ' ... 
'year = {1990}, ' ...
'title = {Life history studies on some cladocera under laboratory conditions}, ' ...
'journal = {J. Andaman Sci. Assoc.}, ' ...
'volume = {6(2)}, ' ...
'pages = {127-132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
