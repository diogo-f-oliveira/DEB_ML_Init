function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_aurita 

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_aurita'; 
metaData.species_en = 'Round sardinella'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW', 'MAE'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Handjar Houria'};                      
metaData.date_subm = [2015 08 21];                 
metaData.email    = {'handjarhouria@gmail.com'};   
metaData.address  = {'Tiaret, 14000, Algeria'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 02 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 


%% set data
% zero-variate data;

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Hour2015';    
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 450;   units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'Hour2015';
  temp.ap = C2K(19);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 2190;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Hour2015';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.3;  units.Lb  = 'cm';   label.Lb  = ' total length';           bibkey.Lb  = 'Hour2015';
data.Lp  = 16;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'TsikAnto2006';
data.Li  = 28.42; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Hour2015';

data.Wwb = 1.984e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Hour2015';
  comment.Wwb = 'Calculated as Wwi*(Lb/Li)^3';
data.Wwi = 166;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Hour2015';

data.Ri  = 200;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'TsikAnto2006';  
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL = [365	730	1095 1460 1825 ;    % d, time since birth
          11.18 16.67 20.28 24.03 26.54]';  % cm, total length at f and T
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hour2015';

% length-weight data
data.LW = [9	8.8	9	8.5	9.5	9.4	9.5	9	9.5	9	9.5	9.7	10	9	9.5	9.4	10	10.5	10.4	11	10.6	10.3	10	9.4	10	10.5	9.8	10.5	10.2	10.5	9.8	10.8	10.7	11.6	11.6	11.5	12	11	11.5	11.5	12	12	13.6	12.8	12	12.7	12	12	12	11.9	12.3	12	12	12.5	12.3	12.5	12.1	12	12.3	12.4	12.8	12	12.5	12.5	12.8	12.8	12.5	12.7	12	13	13.2	13.5	12.7	13	13	13	13.5	13	13.4	13.2	13.8	13.8	13.4	12.7	14	14	13.7	13.5	14.2	14.4	11.8	13.4	14	14.2	24.3	14.2	15.8	14.8	14.3	14.2	13.80	25.3	14.7	14.5	13.2	14.8	14.5	14.7	14.4	14.3	14.1	15	14.00	15	14.8	14.7	14.5	14.9	14.8	14.30	16	15.3	14.7	15.5	15.2	15.10	15.5	14.9	15.2	14.60	14.40	15.7	15.2	16	15.2	15.20	15.00	14.60	15.7	15.5	15.6	16.2	15.80	16	15.50	15.5	15.6	15.9	15.80	17	15.8	15.90	16.10	16.10	15.80	17.1	16.7	16.50	16.20	16.50	16.50	17.3	16.8	16.60	16.90	16.60	17.10	16.80	17	18.60	18	17.00	17.7	18	17.40	17.40	17.80	19	19.5	17.30	17.50	18	18.5	20	17.8	18.10	18.00	16.50	19.2	17.7	20	18.3	18.6	18	18.20	17.60	17.50	18.5	18.30	18.20	18.5	18.30	18.20	19.00	18.20	19.5	21	19	18.3	19	19	19.7	18.5	19	19.5	20.5	20.1	19.2	19.4	19.4	19	19.5	19.5	19.7	20	20.3	19.6	21.1	20	20.2	21	20.5	20.3	19.9	20.1	22	19.80	20.2	20.5	21	20.4	20.3	21	21.9	21.6	21.2	21.4	21.7	21	21.8	21.5	21.1	21.8	22.2	21	20.5	22	21	22	22	21.9	22.3	22.2	22.5	23	22.5	22.3	23	23	21.3	22.5	22.5	22	24	23	22.5	23	23.7	23	24	23.3	22.9	23.8	23	24	23.3	23.9	24.4	23.7	24	24.5	24	23.9	24.4	24.3	25.8	25.5	24.9	26	25.6	25.2	25.6	26	26.8	27.8	27.5;      % cm, total length at f
           4	4	5	5	5	5	5	5	5	5	6	6	6	6	6	6	6	6	7	7	7	7	7	7	7	7	7	7	7	8	8	8	8	9	9	9	9	9	10	10	10	10	10.8	11	11	11	11	11	11	12	12	12	12	12	12	12	12	12	13	13	13	13	13	13	13	13	13	14	14	14	14	14	15	15	15	15	15	15	16	16	16	16	17	17	17	17	17	17	18	18	18	18	19	19	119.5	20	20	20	20	20	20	120.4	21	21	21	21	21	21	21	22	22	22	22	23	23	23	23	23	23	23	24	24	24	24	24	24	25	25	25	25	25	26	26	26	26	26	26	26	27	27	27	27	28	29	29	30	30	30	30	31	32	32	33	34	34	35	35	35	35	35	35	36	36	36	37	37	37	37	40	40	41	41	42	42	42	42	43	44	44	44	44	45	45	45	45	45	45	45	46	46	47	47	47	47	47	47	47	48	48	49	50	50	50	51	51	52	52	52	53	53	55	56	57	57	57	58	58	58	58	58	59	59	59	60	60	61	61	62	62	62	62	63	63	64	64	66	66	67	67	68	68	68	69	70	70	71	71	71	72	72	73	74	75	75	75	76	76	77	78	81	81	82	83	83	84	84	85	85	88	88	88	90	92	93	93	95	95	96	97	98	99	99	99	101	102	104	105	107	107	110	111	113	114	117	121	121	127	128	134	135	142	142	149	153	157	178]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Hour2015';

% weight-fecundity
data.WN = [ ...
19.944	12818.535
30.135	16679.539
39.878	19150.580
49.959	24092.664
60.040	28416.989
69.905	38918.919
100.064	72432.433];
units.WN = {'g', '#'};  label.WN = {'wet weight', 'number of eggs'};  
temp.WN = C2K(19);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'TsikAnto2006';
comment.WN = 'temp is guessed';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '79MLF'; % Cat of Life
metaData.links.id_ITIS = '161763'; % ITIS
metaData.links.id_EoL = '46562413'; % Ency of Life
metaData.links.id_Wiki = 'Sardinella_aurita'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_aurita'; % ADW
metaData.links.id_Taxo = '42665'; % Taxonomicon
metaData.links.id_WoRMS = '126422'; % WoRMS
metaData.links.id_fishbase = 'Sardinella-aurita'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella_aurita}}';
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
bibkey = 'Hour2015'; type = 'Misc'; bib = [ ... 
'author = {Handjar Houria}, ' ... 
'year = {2015}, ' ...
'note = {Own measurements}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TsikAnto2006'; type = 'Article'; bib = [ ... 
'author = {A. C. Tsikliras and E. Antonopoulou}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive biology of round sardinella (\emph{Sardinella aurit}a) in the north-eastern {M}editerranean}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {70}, ' ...
'pages = {281--290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
